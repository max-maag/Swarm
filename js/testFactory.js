// Generated by CoffeeScript 1.8.0
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(["entityFactory", "entity", "position", "velocity", "acceleration", "swarm", "lonely", "render"], function(EntityFactory, Entity, Position, Velocity, Acceleration, Swarm, Lonely, Render) {
    var TestFactory;
    return TestFactory = (function(_super) {
      __extends(TestFactory, _super);

      function TestFactory() {
        return TestFactory.__super__.constructor.apply(this, arguments);
      }

      EntityFactory.register("name", new TestFactory());

      TestFactory.build = function(x, y) {
        return new Entity(new Position(x, y), new Velocity(0, 0), new Acceleration(0, 0), new Swarm(), new Lonely(), new Render(PIXI.Sprite.fromImage("../res/img/swarmentity.png")));
      };

      return TestFactory;

    })(EntityFactory);
  });

}).call(this);
