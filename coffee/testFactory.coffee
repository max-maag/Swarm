define [
  "entityFactory"
  "entity"
  "position"
  "velocity"
  "render"
 ], (EntityFactory, Entity, Position, Velocity, Render) ->
  class TestFactory extends EntityFactory
    EntityFactory.register new TestFactory(), "test"
     
    build: () ->
      new Entity(new Position(), new Velocity(), new Render(PIXI.Sprite.fromImage "../res/img/swarmentity.png"))
    
    
