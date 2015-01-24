define [
  "entityFactory",
  "entity",
  "position",
  "graviton"
 ], (EntityFactory, Entity, Position, Graviton) ->
  class TestFactory extends EntityFactory
    EntityFactory.register "name" ,new TestFactory()
     
    @build: (x,y) ->
      new Entity(new Position(x,y), new Graviton())
    
    
