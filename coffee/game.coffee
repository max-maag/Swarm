define [
  'world'
  'renderer'
  'movement'
  'entityFactory'
  'testFactory'
  'fpsCounterFactory'
  'fpsCounterSystem'
  'swarmSystem'
  'inputSystem'
  'inputEvent'
  'entity'
], (
  World, Renderer, Movement, EntityFactory, TestFactory, FpsCounterFactory,
  FpsCounterSystem, SwarmSystem, InputSystem, InputEvent, Entity) ->
  class Game

    constructor: (@render, @stage, @gameContainer) ->
      @lastFrame = Date.now()

      @circle = PIXI.Sprite.fromImage "../res/img/square.png"
      @gameContainer.addChild @circle
      
      @world = new World()
      
      @world.addSystem new SwarmSystem
      @world.addSystem new Movement
      @world.addSystem new Renderer @gameContainer
      @world.addSystem new InputSystem @world

      @world.addSystem new FpsCounterSystem @stage

      swarmCount = 50
      for i in [1..swarmCount]
        @world.addEntity TestFactory.build 200 + Math.cos(i/2/Math.PI), 200 + Math.sin(i/2/Math.PI)
      
      @world.addEntity FpsCounterFactory.build()
      
      window.onmousedown = (event) =>
        @world.addEntity new Entity(new InputEvent(event))
      
       

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
