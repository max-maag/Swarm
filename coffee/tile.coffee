define [], () ->
  class Tile
    ###
    Creates a Tile
    @param {string} @name tile name
    @param {boolean} @isWall true if the player can walk over this tile
    ###
    constructor: (@name, @isWall) ->
      @textureCache = {}
      @sprite = new PIXI.Sprite()
      @update @name, @isWall

    update: (name, isWall) ->
      @name = name
      @isWall = isWall

      if !(@name in @textureCache)
        @textureCache[@name] = PIXI.Texture.fromImage "../res/img/tile_"+@name+".png"

      @sprite.setTexture @textureCache[@name]

    toString: () ->
      return @name
