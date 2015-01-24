define ['perlinNoise'], (PerlinNoise) ->
  class ChunkGenerator
    ###
    Generates a chunk
    ###
    constructor: () ->
      @perlinNoise = new PerlinNoise Math.random()

      @tiles = [
        {
          name: "blue",
          isWall: true,
          frequency: 40
        }, {
          name: "orange",
          isWall: false,
          frequency: 25
        }, {
          name: "green",
          isWall: false,
          frequency: 35
        }
      ]

    ###
      returns an (generated) chunk
      @param {chunk} @chunk the chunk that should be generated
    ###
    generate: (@chunk) ->
      tiles = [0...@chunk.dim.x]
      for _, x in tiles
        tiles[x] = [0...@chunk.dim.y]

        for _, y in tiles[x]
          freqSum = 0
          freqSum += tile.frequency for tile in @tiles

          threshold = freqSum * @perlinNoise.perlin(x*@chunk.offset.x*@chunk.dim.x, y*@chunk.offset.y*@chunk.dim.y)
          freqSum = 0
          choosenTile = 0

          for tile in @tiles
            freqSum += tile.frequency
            if freqSum >= threshold then break
            choosenTile = tile

          tiles[x][y].update choosenTile.name, choosenTile.isWall

      return tiles
