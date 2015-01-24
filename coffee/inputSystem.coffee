define ['inputEvent', 'entityProcessingSystem'], (InputEvent, EntityProcessingSystem) ->
  class InputSystem extends EntityProcessingSystem
    constructor: (@world) ->
      super ['event']
      
    processEntity: (e, dt) ->
      # TODO react, i.e spawn Graviton, etc.
      console.log e.event.type
      @world.removeEntity e
