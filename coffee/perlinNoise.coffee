define ["vector"], (Vector) ->
  class PerlinNoise
    constructor: (@seed) ->

    ###
     * this is not! perlin noise ... not enough time ...
     * values taken from delphigl.com
     * @return {integer} number between -1 and 1
    ###
    perlin: (x,y) ->
      n = x + y * 57 + @seed*1000;
      n = ( n << 13 ) ^ n;
      rand = 1 - ( (n * (n * n * 15731 + 789221) + 1376312589) & 0x7fffffff) / 1073741824;
      return rand
