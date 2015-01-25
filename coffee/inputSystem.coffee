define [
  'inputEvent'
  'entityProcessingSystem'
  'gravitonFactory'
], (InputEvent, EntityProcessingSystem, GravitonFactory) ->
  class InputSystem extends EntityProcessingSystem
    constructor: (@world) ->
      super ['event']

    processEntity: (e, dt) ->
      switch e.event.type
        when 'mousedown' then @world.addEntity GravitonFactory.build e.event.offsetX, e.event.offsetY
        else console.log e.event.type

      @world.removeEntity e
