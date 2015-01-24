define [
  "entityFactory",
  "entity",
  "position",
  "velocity",
  "render"
 ], (EntityFactory, Entity, Position, Velocity, Render) ->
  class TestFactory extends EntityFactory
    EntityFactory.register "name" ,new TestFactory()
     
    @build: () ->
      new Entity(new Position(100,100), new Velocity(1/200,1/200), new Render(PIXI.Sprite.fromImage "../res/img/swarmentity.png"))
    
    
