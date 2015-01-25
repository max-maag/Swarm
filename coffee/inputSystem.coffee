define [
  'inputEvent'
  'entityProcessingSystem'
  'gravitonFactory'
], (InputEvent, EntityProcessingSystem, GravitonFactory) ->
  class InputSystem extends EntityProcessingSystem
    constructor: (@world, @gameContainer) ->
      super ['event']

    processEntity: (e, dt) ->
      switch e.event.type
        when 'mousedown' then @world.addEntity GravitonFactory.build e.event.offsetX-@gameContainer.position.x, e.event.offsetY-@gameContainer.position.y
        else console.log e.event.type

      @world.removeEntity e
