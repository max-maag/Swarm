define [
  "entityFactory",
  "entity",
  "position",
  "graviton",
  "render"
 ], (EntityFactory, Entity, Position, Graviton, Render) ->
  class TestFactory extends EntityFactory
    EntityFactory.register "name" ,new TestFactory()

    @build: (x,y) ->
      new Entity(new Position(x,y), new Graviton(), new Render(PIXI.Sprite.fromImage "../res/img/graviton.png"))
