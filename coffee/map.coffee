define ["vector"], (Vector) ->
  class Map
    ###
     * represents a world of chunks
     * @param  {vec2} @position        position to generate world at
     * @param  {int} @chunkThreshhold threshhold distance to generate or keep chunks
     * @param  {int} @chunkDim        number of tiles on each chunk axis
     * @param  {int} @tileSize        size of each tile
    ###
    constructor: (@position, @chunkThreshhold, @chunkDim, @tileSize) ->
      @chunks = [0..@chunkThreshhold]
      for x in @offset
        @chunks = [0...@chunkThreshhold]
        for y in @chunks[x]
          @offset[x][y]=new Chunk((new Vector x y), @chunkDim, @tilesize, @worldGen)

      @bounds=@calculateBounds()

    calculateBounds: () ->
      mapSize = ((@chunkDim*@tileSize)*@chunkThreshhold)
      topLeft =@toChunkOffset @position.sub (new Vector mapSize)
      botRight=@toChunkOffset @position.add (new Vector mapSize)
      
      bounds =
        tl : topLeft
        br : botRight
      bounds

    move: (translation) ->
      @position = @position.add translation
      
      bounds=@calculateBounds position
      diff=bounds.tl.sub @bounds.tl

      if (diff.x!=0)
        #need to generate new chunks
        if diff.x>0
          #moved right
          for i in [0..diff.x] by 1
            column=@chunks.shift()
            newX = @column[@column.length -1].offset.x +1
            @chunks.push column

            for y in column
              column[y].reconfigure (new Vector newX y)
        else
          #moved left
          for i in [0..diff.x] by 1
            column=@chunks.pop()
            newX = @column[0].offset.x - 1
            @chunks.unshift column

            for y in column
              column[y].reconfigure (new Vector newX y)

      if (diff.y!=0)
        #need to generate new chunks
        if diff.y<0
          #moved up
          newY = @column[0][0].offset.y - 1
          for x in [0..@chunks] by 1
            column=@chunks[x]
            for y in [0..diff.y] by 1
              shift=@column.pop()
              @column.unshift shift
              
              shift.reconfigure (new Vector x (newY + y)) #minus because diff.y is negative
        else
          #moved down
          newY = @column[0][@column[0].length -1 ].offset.y +1
          for x in [0..@chunks] by 1
            column=@chunks[x]
            for y in [0..diff.y] by 1
              shift=@column.shift()
              @column.push shift
              
              shift.reconfigure (new Vector x (newY + y)) #minus because diff.y is positive
      
      @bounds=bounds

    ###
     * calculates the chunk the position is placed on
     * @param  {vec2} position global position
     * @return {vec2}          chunk coordinates
    ###
    toChunkOffset: (position) =>
      ((position.div @tileSize).forEach Math.floor).div @chunkDim

    worldGen: (chunk, offset) ->
      #TODO new Tile(...)
      true