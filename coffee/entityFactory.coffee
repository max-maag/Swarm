require ['entity'], (Entity) ->
  class EntityFactory
    factories = []
    
    @register: (clazz, factory) ->
      factories[clazz] = factory
      
    @for: (clazz) -> factories[clazz]
    
    build: () -> new Entity()
