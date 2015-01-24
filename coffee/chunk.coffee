define ["vector","tile"], (Vector,Tile) ->
  class Chunk
    ###
     * creates a chunk with level information
     * @param  {vec2} @offset (chunk) offset of the chunk
     * @param  {int} @dimension   number of tiles on each axis
     * @param {int} @tilesize size of tiles
     * @param  {chunkGenerator} @chunkGen class to create tiles
    ###
    constructor: (@offset, @dimension, @tilesize, @chunkGen, @gameContainer) ->
      @tiles=[]
      @tiles = [0...@dimension]
      for x in [0...@tiles.length]
        @tiles[x] = [0...@dimension]
        for y in [0...@tiles[x].length]
          @tiles[x][y] = new Tile "none", false, @gameContainer, new Vector(), @tilesize
      @reconfigure(@offset)

    ###
     * generates chunk at new position
     * @param {vec2} @offset new chunk offset
    ###
    reconfigure: (offset) ->
      @offset=offset
      @chunkGen.generate @

      posPerChunk = @dimension*@tilesize
      chunkVec = new Vector @offset.x*posPerChunk, @offset.y*posPerChunk
      for x in [0...@tiles.length]
        for y in [0...@tiles[x].length]
          pos = new Vector x*@tilesize, y*@tilesize
          tilePos = Vector.add chunkVec, pos
          @tiles[x][y].updatePos tilePos

    ###
     * converts a global position to tile offsets
     * @param {vec2} pos position to convert
     * @return {vec2} tile offset reltive to this tile
    ###
    toTileOffset: (pos) ->
      new Vector(
        (Math.floor (pos.x / @tilesize) / @dimension)-(@offset.x*@tilesize),
        (Math.floor (pos.y / @tilesize) / @dimension)-(@offset.y*@tilesize))

    ###
     * determines if a tile is a wall
     * @param {vec2} offset tile offset of the tile to be tested
     * @return {bool} returns bool on true
    ###
    isWall: (offset) ->
      @offset[x][y].isWall()

    toData: () ->
      res = []
      for x in [0...@tiles.length]
        for y in [0...@tiles.length]
          ch =
            x: x
            y: y
            data: @tiles[x][y].toString()
          res.push ch

      return res
