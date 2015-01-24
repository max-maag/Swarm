define [], () ->
  class Game
    constructor: (@render, @stage) ->
      @lastFrame = Date.now()

      @circle = PIXI.Sprite.fromImage "../res/img/square.png"
      @stage.addChild @circle

    step: () =>
      console.log("S down "+input.keydown(input.KEY.S));
      console.log("S hit") if input.keyhit(input.KEY.S)
      input.flushkeys();


      dt = Date.now() - @lastFrame
      @lastFrame = Date.now()
      requestAnimFrame @step
      @update dt
      @render()
      @lastFrame += dt

    update: (dt) =>
      @circle.position.x = 300+Math.sin(@lastFrame /1000)*300
