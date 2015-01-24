define [], () ->
  class Tile
    ###
    Creates a Tile
    @param {string} @name tile name
    @param {boolean} @isWall true if the player can walk over this tile
    ###
    constructor: (@name, @isWall, @gameContainer, @pos, @size) ->
      @textureCache = {}
      @sprite = new PIXI.Sprite()
      @sprite.width = @size/256
      @sprite.height= @size/256


      @gameContainer.addChild @sprite
      @update @name, @isWall

    update: (name, isWall) ->
      @name = name
      @isWall = isWall

      if !(@name in @textureCache)
        @textureCache[@name] = PIXI.Texture.fromImage "../res/img/tile_"+@name+".png"

      @sprite.setTexture @textureCache[@name]

    updatePos: (pos) ->
      @pos=pos
      @sprite.position.x = @pos.x
      @sprite.position.y = @pos.y


    toString: () ->
      return @name+": ["+@pos.x+","+@pos.y+"]"
