define ['perlinNoise'], (PerlinNoise) ->
  class ChunkGenerator
    ###
    Generates a chunk
    ###
    constructor: () ->
      @perl = new SimplexNoise
      @noiseFactor = 20

      @tiles = [
        {
          name: "blue",
          isWall: false,
          frequency: 10
        }, {
          name: "orange",
          isWall: true,
          frequency: 30
        }, {
          name: "green",
          isWall: true,
          frequency: 35
        }
      ]

    ###
      returns an (generated) chunk
      @param {chunk} chunk the chunk that should be generated
    ###
    generate: (chunk) ->
      for x in [0...chunk.tiles.length]
        for y in [0...chunk.tiles[x].length]
          freqSum = 0
          freqSum += tile.frequency for tile in @tiles

          perlinRand = @perl.noise (x+(chunk.offset.x*chunk.dimension))/@noiseFactor, (y+(chunk.offset.y*chunk.dimension))/@noiseFactor
          threshold = freqSum * perlinRand

          freqSum = 0
          choosenTile = @tiles[0]

          for tile in @tiles
            freqSum += tile.frequency
            choosenTile = tile
            if freqSum > threshold then break

          chunk.tiles[x][y].update choosenTile.name, choosenTile.isWall
