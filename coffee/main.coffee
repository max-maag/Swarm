require ['game'], (Game) ->
  if console
    console.info "If you can read this, you probably don't see the game. Close the console on page load or the game breaks!"

  input.init()

  stage = new PIXI.Stage 0xdddddd
  renderer = PIXI.autoDetectRenderer 999, 562 # ca. 16:9
  #window.onresize = () ->
  #  renderer.resize window.innerWidth, window.innerHeight

  gameContainer = new PIXI.SpriteBatch()

  stage.addChild gameContainer
  document.getElementById('canvaswrapper').appendChild renderer.view

  game = new Game (() -> renderer.render stage), stage, gameContainer, renderer.view

  assetLoader = new PIXI.AssetLoader ["../res/img/tile_blue.png","../res/img/tile_green.png","../res/img/tile_orange.png"], true

  assetLoader.onComplete = () ->
    #window.setInterval game.step, 10
    #requestAnimFrame game.step
    requestAnimFrame game.renderloop

  assetLoader.load()
