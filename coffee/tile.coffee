define [], () ->
	class Tile
		@textureCache = {}

		###
		Creates a Tile
		@param {string} @name tile name
		@param {boolean} @isWall true if the player can walk over this tile
		###
		constructor: (@name, @isWall) ->
			update @name, @isWall

		update: (@name, @isWall) ->
			if !(@name in @textureCache)
				@textureCache[@name] = PIXI.Texture.fromImage "../res/img/tile_"+@name+".png"

			@sprite = PIXI.Sprite.setTexture @textureCache[@name]
