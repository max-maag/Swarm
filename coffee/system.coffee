define [], () ->
  class System
    constructor: (@requiredComponents) ->
      @entities = []

    addEntity: (entity) =>
      @entities[entity.id] = entity
      @onEntityAdded entity
      
    removeEntity: (entity) =>
      @onEntityRemoved entity
      delete @entities[entity.id]
      
    onEntityAdded: (entity) ->
    
    onEntityRemoved: (entity) ->
 
    checkEntity: (entity) =>
      console.log "check "
      console.log entity
      for c in @requiredComponents
        unless entity[c]?
          console.log "missing " + c 
          return
        
      @addEntity entity

    process: (dt) ->
