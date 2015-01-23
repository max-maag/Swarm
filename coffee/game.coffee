define [], () ->
  class Game
    constructor: (@render, @stage) ->
      @lastFrame = Date.now()

      @circle = new PIXI.Graphics()
      @circle.beginFill 0x00ff00, 1
      @circle.drawCircle 0, 0, 50
      @circle.position.x = 100
      @circle.position.y = 100
      @stage.addChild @circle
      

    step: () =>
      dt = Date.now() - @lastFrame
      requestAnimFrame @step
      @update dt
      @render

    update: (dt) =>
      @circle.position.x += 50 * Math.sin dt / 1000
