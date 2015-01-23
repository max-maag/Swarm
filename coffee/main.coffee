require ['game'], (Game) ->
  stage = new PIXI.Stage 0xffffff
  renderer = PIXI.autoDetectRenderer 800, 600
  gameContainer = new PIXI.DisplayObjectContainer()

  stage.addChild gameContainer
  document.body.appendChild renderer.view

  game = new Game (() -> renderer.render stage), stage
  requestAnimFrame game.step
