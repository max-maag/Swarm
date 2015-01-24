define ['entity', 'testFactory'], (Entity, TestFactory) ->
  class EntityFactory
    factories = []
    
    @register: (name, factory) ->
      factories[name] = factory
      
    @for: (name) -> factories[clazz]
    
    build: () -> new Entity()
