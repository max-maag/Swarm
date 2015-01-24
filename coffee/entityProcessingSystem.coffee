define ['system'], (System) ->
  class EntityProcessingSystem extends System
  

    processEntity: (entity, dt) ->

    process: (dt) =>
      for k in Object.keys(@entities)
        @processEntity @entities[k], dt
