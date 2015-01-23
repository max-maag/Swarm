define [], () ->
  class Game
    constructor: (@render, @stage) ->
      @lastFrame = Date.now()

      @circle = PIXI.Sprite.fromImage "../res/img/square.png"
      @stage.addChild @circle
      

    step: () =>
      dt = Date.now() - @lastFrame
      @lastFrame = Date.now()
      requestAnimFrame @step
      @update dt
      @render()
      @lastFrame += dt

    update: (dt) =>
      @circle.position.x += 50 * Math.sin dt / 1000
