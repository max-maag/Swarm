define ["entityFactory"], (EntityFactory) ->
  class TestFactory extends EntityFactory
    #EntityFactory.register new TestFactory(), "test"
     
    build: () ->
      new Entity([new Position(), new Velocity(), new Render(PIXI.Sprite.fromImage "../res/img/swarmentity.png")])
    
    
