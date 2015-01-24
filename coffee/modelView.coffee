require ['vector'], (Vector) ->
  class ModelView
    constructor: (@sprite, pos = new Vector()) ->
      @sprite.position = new Vector @sprite.position
      @vel = new Vector()
      @acc = new Vector()

    getPosition: () -> @sprite.position

    ###
      Use either as setPosition(number, number) or
      as setPosition(PIXI.Point)
    ###
    setPosition: (x, y) ->
      if y?
        @sprite.position.set x, y
      else
        # x is a point
        @sprite.position.set x.x, y.x

    ###
      Use either as translate(number, number) or
      as translate(PIXI.Point)
    ###
    translate: (x, y) ->
      if y?
        setPosition @position.x + x, @position.y + y
      else
        # x is a point
        setPosition

    getWidth: () -> @sprite.width

    setWidth: (width) ->
      @sprite.width = width

    getHeight: () -> @sprite.height

    setHeight: (height) ->
      @sprite.height = height

    
