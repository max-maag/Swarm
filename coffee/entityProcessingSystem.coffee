define ['system'], (System) ->
  class EntityProcessingSystem extends System
  

    processEntity: (entity, dt) ->

    process: (dt) =>
      for e in @entities
        @processEntity e, dt
