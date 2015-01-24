define [
  'entityFactory'
  'entity'
  'fpsCounter'
  'position'
], (EntityFactory, Entity, FpsCounter, Position) ->
  class FpsCounterFactory extends EntityFactory
    @build: (container) ->
      view = new PIXI.Text "-- FPS", {font:"20px Arial", fill:"red"}
      view.position.x = 10
      view.position.y = 10
      
      return new Entity(
        new FpsCounter(view)
      )
