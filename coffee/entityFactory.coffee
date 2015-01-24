define ['entity'], (Entity) ->
  class EntityFactory
    factories = []
    
    @register: (name, factory) ->
      factories[name] = factory
      
    @for: (name) -> factories[name]
    
    build: () -> new Entity()
