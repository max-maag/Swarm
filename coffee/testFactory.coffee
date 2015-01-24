define [
  "entityFactory",
  "entity",
  "position",
  "velocity",
  "acceleration"
  "swarm"
  "render"
 ], (EntityFactory, Entity, Position, Velocity, Acceleration,Swarm, Render) ->
  class TestFactory extends EntityFactory
    EntityFactory.register "name" ,new TestFactory()
     
    @build: (x,y) ->
      new Entity(new Position(x,y), new Velocity(1/100,1/100), new Acceleration(0,0), new Swarm(), new Render(PIXI.Sprite.fromImage "../res/img/swarmentity.png"))
    
    
