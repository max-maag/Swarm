define [
  "entityFactory",
  "entity",
  "position",
  "velocity",
  "acceleration"
  "swarm"
  "lonely"
  "render"
 ], (EntityFactory, Entity, Position, Velocity, Acceleration,Swarm,Lonely, Render) ->
  class TestFactory extends EntityFactory
    EntityFactory.register "name" ,new TestFactory()
     
    @build: (x,y) ->
      new Entity(new Position(x,y), new Velocity(0,0), new Acceleration(0,0), new Swarm(),new Lonely(), new Render(PIXI.Sprite.fromImage "../res/img/swarmentity.png"))
    
    
