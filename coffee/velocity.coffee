define ["vector", "component"], (Vector, Component) ->
  class Velocity extends Component
    
    
    constructor: (x = 0, y = 0) -> 
      @name = "velocity"
      @vector = new Vector x,y
      @speed = 0.1
    
    
