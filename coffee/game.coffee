define ['world','renderer','movement',"swarmSystem", 'entityFactory' , 'testFactory' ], (World,Renderer,Movement, SwarmSystem, EntityFactory, TestFactory) ->
  class Game
    FPSsum = 0
    curFramesCount = 0
    curSeconds = 0

    constructor: (@render, @stage, @gameContainer) ->
      @lastFrame = Date.now()

      @circle = PIXI.Sprite.fromImage "../res/img/square.png"
      @gameContainer.addChild @circle

      @fpsText = new PIXI.Text "-- FPS", {font:"20px Arial", fill:"red"}
      @fpsText.position.x = 10
      @fpsText.position.y = 10
      @stage.addChild @fpsText
      
      @world = new World()
      
      @world.addSystem new SwarmSystem
      @world.addSystem new Movement
      @world.addSystem new Renderer @gameContainer
      
      
      for i in [1..50]
        @world.addEntity TestFactory.build(100+i*1,100)
      
       

    step: () =>
      dt = Date.now() - @lastFrame
      requestAnimFrame @step
      @world.update dt
      @update dt
      @render()
      @lastFrame += dt

    update: (dt) =>

      # FPS
      FPSsum++
      curTime = new Date()
      if (curSeconds == curTime.getSeconds())
        curFramesCount++
      else
        @fpsText.setText curFramesCount+" FPS"
        curFramesCount = 1
        curSeconds = curTime.getSeconds()

      @circle.position.x = 300+Math.sin(@lastFrame /1000)*300

      input.flushkeys()
