define [
  'world'
  'renderer'
  'movement'
  'entityFactory'
  'testFactory'
  'fpsCounterFactory'
  'fpsCounterSystem'
  'swarmSystem'
  'map'
  'mapSystem'
  'vector'
], (World,Renderer,Movement, EntityFactory, TestFactory, FpsCounterFactory, FpsCounterSystem, SwarmSystem, Map, MapSystem, Vector) ->
  class Game

    constructor: (@render, @stage, @gameContainer) ->
      @lastFrame = Date.now()

      pos = new Vector(0, 0)
      tres = 5
      dim = 3
      tilesize = 50
      map = new Map(pos, tres, dim, tilesize, @gameContainer)
      console.log toString()

      @world = new World()

      @world.addSystem new SwarmSystem
      @world.addSystem new Movement
      @world.addSystem new Renderer @gameContainer

      @world.addSystem new FpsCounterSystem @stage

      for i in [1..50]
        @world.addEntity TestFactory.build(100+i*1,100)

      @world.addEntity FpsCounterFactory.build()


    step: () =>
      dt = Date.now() - @lastFrame
      requestAnimFrame @step
      @world.update dt
      @update dt
      @render()
      @lastFrame += dt

    update: (dt) =>
      input.flushkeys()
