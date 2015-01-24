define ["vector","component"], (Vector, Component) ->
  class Acceleration extends Component
    
    
    
    constructor: (x = 0, y = 0) -> 
      @name = "acceleration"
      @vector = new Vector x,y
