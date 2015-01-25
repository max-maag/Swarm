define [
  'world'
  'renderer'
  'movement'
  'lonelyMovement'
  'entityFactory'
  'testFactory'
  'gravitonFactory'
  'flowFactory'
  'fpsCounterFactory'
  'fpsCounterSystem'
  'swarmSystem'
  'inputSystem'
  'inputEvent'
  'entity'
  'gravitonSystem'
  'flowSystem'
  'map'
  'vector'
], (
  World, Renderer, Movement, LonelyMovement, EntityFactory, TestFactory, GravitonFactory,FlowFactory, FpsCounterFactory,
  FpsCounterSystem, SwarmSystem, InputSystem, InputEvent, Entity, GravitonSystem,FlowSystem, Map, Vector) ->

  class Game

    constructor: (@render, @stage, @gameContainer) ->
      @lastFrame = Date.now()

      pos = new Vector(0, 0)
      tres = 2
      dim = 32
      tilesize = 16
      map = new Map(pos, tres, dim, tilesize, @gameContainer)

      @world = new World()

      swarmSystem = new SwarmSystem()
      @world.addSystem swarmSystem
      @world.addSystem new GravitonSystem swarmSystem
      @world.addSystem new LonelyMovement()

      @world.addSystem new Movement
      @world.addSystem new FlowSystem swarmSystem
      @world.addSystem new Renderer @gameContainer
      @world.addSystem new InputSystem @world

      @world.addSystem new FpsCounterSystem @stage


      swarmCount = 20
      for i in [1..swarmCount]
        @world.addEntity TestFactory.build 200 + Math.cos(i/2/Math.PI), 200 + Math.sin(i/2/Math.PI)


      @world.addEntity FpsCounterFactory.build()

      window.onmousedown = (event) =>
        @world.addEntity new Entity(new InputEvent(event))


      #@world.addEntity GravitonFactory.build 300,300
      @world.addEntity FlowFactory.build 300,300

    step: () =>
      dt = Date.now() - @lastFrame
      requestAnimFrame @step
      @world.update dt
      @update dt
      @render()
      @lastFrame += dt

    update: (dt) =>
      input.flushkeys()
