define ["vector", "chunk", "chunkGenerator"], (Vector, Chunk, ChunkGen) ->
  class Map
    ###
     * represents a world of chunks
     * @param  {vec2} @position        position to generate world at (chunk units)
     * @param  {int} @chunkThreshold Threshold distance to generate or keep chunks
     * @param  {int} @chunkDim        number of tiles on each chunk axis
     * @param  {int} @tileSize        size of each tile
    ###
    constructor: (@position, @chunkThreshold, @chunkDim, @tileSize, @gameContainer) ->
      @chunkGen = new ChunkGen();

      @chunks = [0...@chunkThreshold]
      for x in [0...@chunks.length]
        @chunks[x] = [0...@chunkThreshold]
        for y in [0...@chunks[x].length]
          @chunks[x][y]=new Chunk (new Vector @position.x+x, @position.y+y), @chunkDim, @tileSize, @chunkGen, @gameContainer

      @livePos=new Vector @tileSize*@chunkDim*position.x, @tileSize*@chunkDim*position.y

    ###
     * calculates the chunk the position is placed on
     * @param  {vec2} position global position
     * @return {vec2}          chunk coordinates
    ###
    toChunkOffset: (position) ->
      vector = new Vector(position)
      vector.mul (1/@tileSize)
      vector.mul (1/@chunkDim)
      vector.foreach Math.floor
      vector

    ###
     * moves the map by a vector and generates new chunks according to chunkThreshold
     * @param  {vec2} translation vector to move the map
    ###
    move: (translation) ->
      @livePos.add translation

      newPos = @toChunkOffset @livePos
      diff = Vector.sub newPos, @position

      if (diff.x!=0) or (diff.y!=0)
        @position=new Vector newPos

      if (diff.x!=0)
        #need to generate new chunks
        if diff.x>0
          #moved right
          for x in [0...diff.x] by 1
            newX = @chunks[@chunks.length-1][0].offset.x+1
            column = @chunks.shift()
            @chunks.push column

            for y in [0...column.length]
              column[y].reconfigure (new Vector newX, @position.y+y)
        else
          #moved left
          for i in [0...-diff.x] by 1
            newX = @chunks[0][0].offset.x-1
            column = @chunks.pop()
            @chunks.unshift column

            for y in [0...column.length]
              column[y].reconfigure (new Vector newX, @position.y+y)

      if (diff.y!=0)
        #need to generate new chunks
        if diff.y<0
          #moved up
          newY = @chunks[0][0].offset.y-1
          for x in [0...@chunks.length] by 1
            column = @chunks[x]
            for y in [0...-diff.y] by 1
              shift = column.pop()
              column.unshift shift

              shift.reconfigure (new Vector @position.x+x, newY)
        else
          #moved down
          newY = @chunks[0][@chunks[0].length-1].offset.y+1
          for x in [0...@chunks.length] by 1
            column = @chunks[x]
            for y in [0...diff.y] by 1
              shift = column.shift()
              column.push shift

              shift.reconfigure (new Vector @position.x+x, newY)

    toString: () ->
      res =
        position: @position,
        chunkThreshold: @chunkThreshold,
        chunkDim: @chunkDim,
        tileSize: @tileSize,
        chunks: []

      for x in [0...@chunks.length]
        for y in [0...@chunks.length]
          ch =
            x: x
            y: y
            data: @chunks[x][y].toData()
          res.chunks.push ch

      JSON.stringify res
