define ['perlinNoise'], (PerlinNoise) ->
  class ChunkGenerator
    ###
    Generates a chunk
    ###
    constructor: () ->
      @perlin = new Perlin 'random seed'
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
      @param {chunk} chunk the chunk that should be generated
    ###
    generate: (chunk) ->

      for x in [0...chunk.tiles.length]
        for y in [0...chunk.tiles[x].length]
          freqSum = 0
          freqSum += tile.frequency for tile in @tiles

          #threshold = freqSum * @perlinNoise.perlin(x+(chunk.offset.x*chunk.dimension), y+(chunk.offset.y*chunk.dimension))
          threshold = freqSum * @perlin.noise(x,y,0);
          console.log x+" "+y+" "+threshold
          freqSum = 0
          choosenTile = @tiles[0]

          for tile in @tiles
            freqSum += tile.frequency
            choosenTile = tile
            if freqSum >= threshold then break

          chunk.tiles[x][y].update choosenTile.name, choosenTile.isWall
