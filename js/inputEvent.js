// Generated by CoffeeScript 1.8.0
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['component'], function(Component) {
    var InputEvent;
    return InputEvent = (function(_super) {
      __extends(InputEvent, _super);

      function InputEvent(event) {
        var k, _i, _len, _ref;
        this.event = event;
        this.name = 'event';
        _ref = Object.keys(this.event);
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          k = _ref[_i];
          this[k] = this.event[k];
        }
      }

      return InputEvent;

    })(Component);
  });

}).call(this);
