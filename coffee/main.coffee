require ['game'], (Game) ->
  input.init()
  audioplayer.init()

  stage = new PIXI.Stage 0xdddddd
  renderer = PIXI.autoDetectRenderer 999, 562 # ca. 16:9
  #window.onresize = () ->
  #  renderer.resize window.innerWidth, window.innerHeight

  gameContainer = new PIXI.SpriteBatch()

  stage.addChild gameContainer
  document.getElementById('canvaswrapper').appendChild renderer.view

  game = new Game (() -> renderer.render stage), stage, gameContainer, renderer.view

  assetLoader = new PIXI.AssetLoader ["../res/img/square.png"], true

  assetLoader.onComplete = () ->
    #window.setInterval game.step, 10
    #requestAnimFrame game.step
    requestAnimFrame game.renderloop

  assetLoader.load()
