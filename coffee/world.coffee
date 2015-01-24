define [], () ->
  class World
    constructor: () ->
      @entities = []
      @systems = []
    
    addSystem: (system) =>
      @systems.push system

    addEntity: (entity) =>
      @entities[entity.id] = entity
      for s in @systems
        s.checkEntity entity

    removeEntity: (entity) =>
        for s in @systems
          s.removeEntity entity
        
        delete @entities[entity.id]

    update: (dt) =>
      for s in @systems
        s.process dt
