define ["component"], (Component) ->
  class Gravition extends Component
    constructor: (x = 0, y = 0) ->
      @name = "graviton" 
      @force = 1/10000
      @range = 300
    
