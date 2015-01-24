require [], () ->
  class System
    constructor: (@requiredComponents) ->
      @entities = []

    addEntity: (entity) ->
      @entities[entity.id] = entity
      
    removeEntity: (entity) ->
      delete @entities[entity.id]
 
    checkEntity: (entity) ->
      for c in @requiredComponents
        if entity insanceof c
          addEntity entity

    process: (dt) ->
