define [], () ->
	class Tile
		###
		Creates a Tile
		@param {string} @name tile name
		@param {boolean} @isWall true if the player can walk over this tile
		###
		constructor: (@name, @isWall) ->
			update @name, @isWall

		update: (@name, @isWall) ->
			@sprite = PIXI.Sprite.fromImage "../res/img/tile_"+@name+".png"
