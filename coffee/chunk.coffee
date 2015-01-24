define ["vector","tile"], (Vector,Tile) ->
  class Chunk
    ###
     * creates a chunk with level information
     * @param  {vec2} @offset (chunk) offset of the chunk
     * @param  {int} @dimension   number of tiles on each axis
     * @param {int} @tilesize size of tiles
     * @param  {worldGenerator} @worldGen class to create tiles
    ###
    constructor: (@offset, @dimension, @tilesize, @worldGen) ->
      @tiles=[]
      @tiles = [0...@dimension]
      for x in [0...@tiles.length]
        @tiles[x] = [0...@dimension]
        for y in [0...@tiles[x].length]
          @tiles[x][y]=new Tiles("none");
      @reconfigure()

    ###
     * generates chunk at new position
     * @param {vec2} @offset new chunk offset
    ###
    reconfigure: (offset) ->
      @offset=offset

      @worldGen.generate @

    ###
     * converts a global position to tile offsets
     * @param {vec2} pos position to convert
     * @return {vec2} tile offset reltive to this tile
    ###
    toTileOffset(pos) ->
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
