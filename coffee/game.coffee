define [
  'world'
  'renderer'
  'movement'
  'entityFactory'
  'testFactory'
  'gravitonFactory'
  'fpsCounterFactory'
  'fpsCounterSystem'
  'swarmSystem'
  'inputSystem'
  'inputEvent'
  'entity'
  'gravitonSystem'
  'map'
  'vector'
  'tileCollisionSystem'
], (
  World, Renderer, Movement, EntityFactory, TestFactory, GravitonFactory, FpsCounterFactory,
  FpsCounterSystem, SwarmSystem, InputSystem, InputEvent, Entity, GravitonSystem, Map, Vector,
  TileCollisionSystem) ->

  class Game

    constructor: (@render, @stage, @gameContainer, @renderview) ->
      @lastFrame = Date.now()

      pos = new Vector(3, 3)
      tres = 5
      dim = 3
      tilesize = 20
      @map = new Map(pos, tres, dim, tilesize, @gameContainer)


      @world = new World()


      swarmSystem = new SwarmSystem()
      @world.addSystem swarmSystem
      @world.addSystem new GravitonSystem swarmSystem

      @world.addSystem new Movement
      @world.addSystem new TileCollisionSystem @map
      @world.addSystem new Renderer @gameContainer
      @world.addSystem new InputSystem @world

      @world.addSystem new FpsCounterSystem @stage

      swarmCount = 10
      for i in [1..swarmCount]
        @world.addEntity TestFactory.build 200 + Math.cos(i/2/Math.PI), 200 + Math.sin(i/2/Math.PI)

      @world.addEntity FpsCounterFactory.build()

      @renderview.onmousedown = (event) =>
        @world.addEntity new Entity(new InputEvent(event))

      @world.addEntity GravitonFactory.build 300,300

    step: () =>

      if input.keyhit input.KEY.W
        @map.move(new Vector(0,-80))

      if input.keyhit input.KEY.S
        @map.move(new Vector(0,80))

      if input.keyhit input.KEY.A
        @map.move(new Vector(-80,0))

      if input.keyhit input.KEY.D
        @map.move(new Vector(80,0))

      dt = Date.now() - @lastFrame
      requestAnimFrame @step
      @world.update dt
      @update dt
      @render()
      @lastFrame += dt

    update: (dt) =>
      input.flushkeys()
