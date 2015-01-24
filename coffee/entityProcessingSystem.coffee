require ['system'], (System) ->
  class EntityProcessingSystem

    processEntity: (entity, dt) ->

    process: (dt) =>
      for e in @entities
        @processEntity e, dt
