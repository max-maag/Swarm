define [], () ->
  class ChunkGenerator
    ###
    Generates a chunk
    ###
    constructor: () ->
      @tiles = [
        {
          name: "blue",
          isWall: true
        }, {
          name: "orange",
          isWall: false
        }, {
          name: "green",
          isWall: false
        }
      ]

    ###
      returns an (generated) chunk
      @param {vec2} @dim chunk dimension
      @param {...}  @neighbours #TODO
    ###
    generate: (@dim) ->
      tiles = [0..@dim.x]
      for x in tiles
        tiles[x] = [0..@dim.y]

        for y in tiles[x]
          tileindex = Math.floor(Math.random()*@tiles.length)
          tiles[x][y] = new Tile @tiles[tileindex].name, @tiles[tileindex].isWall

      return tiles
