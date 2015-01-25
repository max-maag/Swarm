define [
  "entityFactory",
  "entity",
  "position",
  "flow"
  "render"
 ], (EntityFactory, Entity, Position, Flow,Render) ->
  class FlowFactory extends EntityFactory
    EntityFactory.register "name" ,new FlowFactory()
     
    @build: (x,y) ->
      new Entity(new Position(x,y), new Flow(0.5,0), new Render(PIXI.Sprite.fromImage "../res/img/swarmentity.png"))
    
    
