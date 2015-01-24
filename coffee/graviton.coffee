define ["component"], (Component) ->
  class Gravition extends Component
    constructor: (x = 0, y = 0) ->
      @name = "graviton" 
      @force = 1/1000
      @range = 300
    
