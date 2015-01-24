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
  'gravitonSystem'
  'map'
  'vector'
  ], (World,Renderer,Movement, EntityFactory, TestFactory,GravitonFactory, FpsCounterFactory, FpsCounterSystem, SwarmSystem, GravitonSystem,Map, Vector) ->
 
  class Game

    constructor: (@render, @stage, @gameContainer) ->
      @lastFrame = Date.now()

      pos = new Vector(0, 0)
      tres = 5
      dim = 3
      tilesize = 50
      map = new Map(pos, tres, dim, tilesize, @gameContainer)

      @world = new World()

    
      swarmSystem = new SwarmSystem()
      @world.addSystem swarmSystem  
      @world.addSystem new GravitonSystem swarmSystem 

      @world.addSystem new Movement
      @world.addSystem new Renderer @gameContainer

      @world.addSystem new FpsCounterSystem @stage

      for i in [1..50]
        @world.addEntity TestFactory.build(100+(i*10)%100,100+i*0.2)
      @world.addEntity GravitonFactory.build 300,300

      
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
