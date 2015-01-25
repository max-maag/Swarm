define [
  'inputEvent'
  'entityProcessingSystem'
  'gravitonFactory'
  'flowFactory'
], (InputEvent, EntityProcessingSystem, GravitonFactory, FlowFactory) ->
  class InputSystem extends EntityProcessingSystem
    constructor: (@world, @gameContainer) ->
      super ['event']

    processEntity: (e, dt) ->
      mousex = e.event.offsetX-@gameContainer.position.x
      mousey = e.event.offsetY-@gameContainer.position.y
      switch e.event.type
        when 'mousedown'
          if e.event.iconid == 0 then @world.addEntity GravitonFactory.build mousex, mousey
          if e.event.iconid == 1 then @world.addEntity FlowFactory.build mousex,mousey
        else console.log e.event.type

      @world.removeEntity e
