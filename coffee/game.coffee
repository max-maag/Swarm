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
  'tileCollisionSystem'
], (
  World, Renderer, Movement, LonelyMovement, EntityFactory, TestFactory, GravitonFactory, FlowFactory, FpsCounterFactory,
  FpsCounterSystem, SwarmSystem, InputSystem, InputEvent, Entity, GravitonSystem, FlowSystem, Map, Vector,
  TileCollisionSystem) ->

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
      @stage.addChild @mouse

      @mouseicons = ['swarmentity', 'square']
      @mouseiconid = 0
      @mouseicon = PIXI.Sprite.fromImage "../res/img/swarmentity.png"
      @stage.addChild @mouseicon

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

      #@world.addSystem new TileCollisionSystem @map

      @world.addSystem new FlowSystem swarmSystem
      @world.addSystem new Renderer @gameContainer
      @world.addSystem new InputSystem @world, @gameContainer

      @world.addSystem new FpsCounterSystem @stage

      swarmCount = 10

      for i in [1..swarmCount]
        @world.addEntity TestFactory.build 1500 + Math.cos(i/2/Math.PI), 1500 + Math.sin(i/2/Math.PI)

      @world.addEntity FpsCounterFactory.build()

      @renderview.onmousedown = (event) =>
        @world.addEntity new Entity(new InputEvent(event))

      @renderview.onmousemove = (event) =>
        @mouse.position.x = event.offsetX
        @mouse.position.y = event.offsetY
        @mouseicon.position.x = 6+event.offsetX
        @mouseicon.position.y = 8+event.offsetY

      #@world.addEntity GravitonFactory.build 300,300

      @world.addEntity FlowFactory.build 300,300


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

      if input.keyhit input.KEY.E
        newname = @mouseicons[((++@mouseiconid%@mouseicons.length)+@mouseicons.length)%@mouseicons.length]
        @mouseicon.setTexture(PIXI.Texture.fromImage('../res/img/'+newname+'.png'))

      if input.keyhit input.KEY.Q
        newname = @mouseicons[((--@mouseiconid%@mouseicons.length)+@mouseicons.length)%@mouseicons.length]
        @mouseicon.setTexture(PIXI.Texture.fromImage('../res/img/'+newname+'.png'))

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
