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
  'pointCounterFactory'
  'pointCounterSystem'
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
  FpsCounterSystem,PointCounterFactory,
  PointCounterSystem,SwarmSystem, InputSystem, InputEvent, Entity, GravitonSystem,FlowSystem, Map, Vector) ->

  class Game

    constructor: (@render, @stage, @gameContainer, @renderview) ->
      @gameContainerAccelx = -150
      @gameContainerAccely = -150

      @lastFrame = Date.now()
      @timestep = 10

      @fps = 0
      @frameCount = 0
      @curSeconds = Date.now()
      @fpsview = new PIXI.Text "-- FPS", {font:"20px Arial", fill:"red"}
      @fpsview.position.x = 10
      @fpsview.position.y = 30
      @stage.addChild @fpsview

      @menubar = PIXI.Sprite.fromImage "../res/img/menubar.png"
      @menubar.position.x = 0
      @menubar.position.y = 562-50
      @stage.addChild @menubar

      @mouse = PIXI.Sprite.fromImage "../res/img/mouse.png"
      @mouse.position.x = 50
      @mouse.position.y = 50
      @stage.addChild @mouse

      pos = new Vector(0, 0)
      tres = 11
      dim = 5
      tilesize = 20
      @map = new Map(pos, tres, dim, tilesize, @gameContainer)


      @world = new World()


      swarmSystem = new SwarmSystem()
      @world.addSystem swarmSystem
      @world.addSystem new GravitonSystem swarmSystem
      @world.addSystem new LonelyMovement()

      @world.addSystem new Movement
      @world.addSystem new FlowSystem swarmSystem
      @world.addSystem new Renderer @gameContainer
      @world.addSystem new InputSystem @world, @gameContainer

      @world.addSystem new FpsCounterSystem @stage
      @world.addSystem new PointCounterSystem @stage, swarmSystem

      swarmCount = 20
      for i in [1..swarmCount]
        @world.addEntity TestFactory.build 1500 + Math.cos(i/2/Math.PI), 1500 + Math.sin(i/2/Math.PI)

      @world.addEntity FpsCounterFactory.build()
      @world.addEntity PointCounterFactory.build()

      @renderview.onmousedown = (event) =>
        @world.addEntity new Entity(new InputEvent(event))

      @renderview.onmousemove = (event) =>
        @mouse.position.x = event.offsetX
        @mouse.position.y = event.offsetY

      #@world.addEntity GravitonFactory.build 300,300

      @world.addEntity FlowFactory.build 1500,1500


    step: () =>
      dt = Date.now() - @lastFrame
      if dt > 1000
        @lastFrame = Date.now()
        return

      pixelstep = dt/5;
      @gameContainerAccelx *= .9
      @gameContainerAccely *= .9
      @gameContainer.position.x += @gameContainerAccelx
      @gameContainer.position.y += @gameContainerAccely
      @map.move(new Vector(0,-@gameContainerAccely))
      @map.move(new Vector(-@gameContainerAccelx,0))

      if input.keydown input.KEY.S
        @gameContainerAccely -= pixelstep

      if input.keydown input.KEY.W
        @gameContainerAccely += pixelstep

      if input.keydown input.KEY.D
        @gameContainerAccelx -= pixelstep

      if input.keydown input.KEY.A
        @gameContainerAccelx += pixelstep

      @timestep = 10
      while dt >= @timestep
        @world.update @timestep
        dt -= @timestep
        @lastFrame += @timestep

      input.flushkeys()
      #@step()

    renderloop: () =>
      if (Date.now() - @curSeconds < 1000)
        @frameCount++
      else
        @fps = @frameCount
        @frameCount = 1
        @curSeconds = Date.now()
        @fpsview.setText "#{@fps} FPS"

      @step()
      @render()
      requestAnimFrame @renderloop
