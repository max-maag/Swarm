// Generated by CoffeeScript 1.8.0
(function() {
  require(['game'], function(Game) {
    var assetLoader, game, gameContainer, renderer, stage;
    if (console) {
      console.info("If you can read this, you probably don't see the game. Close the console on page load or the game breaks!");
    }
    input.init();
    stage = new PIXI.Stage(0xdddddd);
    renderer = PIXI.autoDetectRenderer(999, 562);
    gameContainer = new PIXI.SpriteBatch();
    stage.addChild(gameContainer);
    document.getElementById('canvaswrapper').appendChild(renderer.view);
    game = new Game((function() {
      return renderer.render(stage);
    }), stage, gameContainer, renderer.view);
    assetLoader = new PIXI.AssetLoader(["../res/img/tile_blue.png", "../res/img/tile_green.png", "../res/img/tile_orange.png"], false);
    assetLoader.onComplete = function() {
      return requestAnimFrame(game.renderloop);
    };
    return assetLoader.load();
  });

}).call(this);
