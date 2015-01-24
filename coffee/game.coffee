define [
  'world'
  'renderer'
  'movement'
  'entityFactory'
  'testFactory'
  'fpsCounterFactory'
  'fpsCounterSystem'
  'swarmSystem'
  'gravitonFactory'
  
], (World,Renderer,Movement, EntityFactory, TestFactory, FpsCounterFactory, FpsCounterSystem, SwarmSystem, GravitonFactory) ->
  class Game

    constructor: (@render, @stage, @gameContainer) ->
      @lastFrame = Date.now()

      @circle = PIXI.Sprite.fromImage "../res/img/square.png"
      @gameContainer.addChild @circle
      
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
      @circle.position.x = 300+Math.sin(@lastFrame /1000)*300

      input.flushkeys()
