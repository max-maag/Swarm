define ["vector"], (Vector) ->
  class Map
    ###
     * represents a world of chunks
     * @param  {vec2} @position        position to generate world at
     * @param  {int} @chunkThreshold Threshold distance to generate or keep chunks
     * @param  {int} @chunkDim        number of tiles on each chunk axis
     * @param  {int} @tileSize        size of each tile
    ###
    constructor: (@position, @chunkThreshold, @chunkDim, @tileSize, @worldGen) ->
      @chunks = [0..@chunkThreshold]
      for _, x in @offset
        @chunks = [0...@chunkThreshold]
        for _, y in @chunks[x]
          @offset[x][y]=new Chunk((new Vector x, y), @chunkDim, @tilesize, @worldGen)

      @bounds=@calculateBounds()

    calculateBounds: () ->
      mapSize = ((@chunkDim*@tileSize)*@chunkThreshold)
      topLeft =@.toChunkOffset Vector.sub @position, (new Vector mapSize mapSize)
      botRight=@.toChunkOffset Vector.add @position, (new Vector mapSize mapSize)
      
      bounds =
        tl : topLeft
        br : botRight
      return bounds

    ###
     * moves the map by a vector and generates new chunks according to chunkThreshold
     * @param  {vec2} translation vector to move the map
    ###
    move: (translation) ->
      Vector.add @position, translation, @position
      
      bounds = @calculateBounds @position
      diff = Vector.sub bounds.tl, @bounds.tl

      if (diff.x!=0)
        #need to generate new chunks
        if diff.x>0
          #moved right
          for _, i in [0..diff.x] by 1
            column = @chunks.shift()
            newX = @column[@column.length -1].offset.x +1
            @chunks.push column

            for _, y in column
              column[y].reconfigure (new Vector newX, y)
        else
          #moved left
          for _, i in [0..diff.x] by 1
            column = @chunks.pop()
            newX = @column[0].offset.x - 1
            @chunks.unshift column

            for _, y in column
              column[y].reconfigure (new Vector newX, y)

      if (diff.y!=0)
        #need to generate new chunks
        if diff.y<0
          #moved up
          newY = @column[0][0].offset.y - 1
          for _, x in [0..@chunks] by 1
            column = @chunks[x]
            for _, y in [0..diff.y] by 1
              shift = @column.pop()
              @column.unshift shift
              
              shift.reconfigure (new Vector x, (newY + y)) #minus because diff.y is negative
        else
          #moved down
          newY = @column[0][@column[0].length -1 ].offset.y +1
          for _, x in [0..@chunks] by 1
            column = @chunks[x]
            for _, y in [0..diff.y] by 1
              shift = @column.shift()
              @column.push shift
              
              shift.reconfigure (new Vector x, (newY + y)) #minus because diff.y is positive
      
      @bounds=bounds

    ###
     * calculates the chunk the position is placed on
     * @param  {vec2} position global position
     * @return {vec2}          chunk coordinates
    ###
    toChunkOffset: (position) ->
      vector = new Vector(@tilesize)
      vector.mul (1/@tileSize)
      vector.forEach Math.floor
      vector.mul (1/@chunkDim)