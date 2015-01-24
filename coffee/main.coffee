require ['game'], (Game) ->
  input.init()
  
  stage = new PIXI.Stage 0xdddddd
  renderer = PIXI.autoDetectRenderer window.innerWidth, window.innerHeight
  gameContainer = new PIXI.SpriteBatch()

  stage.addChild gameContainer
  document.body.appendChild renderer.view

  game = new Game (() -> renderer.render stage), gameContainer

  assetLoader = new PIXI.AssetLoader ["../res/img/square.png"], true

  assetLoader.onComplete = () ->
    requestAnimFrame game.step

  assetLoader.load()
