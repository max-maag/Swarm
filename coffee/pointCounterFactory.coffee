define [
  'entityFactory'
  'entity'
  'pointCounter'
  'position'
], (EntityFactory, Entity, PointCounter, Position) ->
  class PointCounterFactory extends EntityFactory
    @build: (container) ->
      view = new PIXI.Text "Points: 00", {font:"20px Arial", fill:"red"}
      view.position.x = 600
      view.position.y = 10
      
      return new Entity(
        new PointCounter(view), new Position(1500,1500)
      )
