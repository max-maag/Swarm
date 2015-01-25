define ["component"], (Component) ->
  class Gravition extends Component
    constructor: (x = 0, y = 0) ->
      @name = "graviton"
      @force = 1/8000
      @range = 500
