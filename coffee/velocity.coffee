define ["vector", "component"], (Vector, Component) ->
  class Velocity extends Component
    
    
    constructor: (x = 0, y = 0) -> 
      @name = "velocity"
      @vector = new Vector x,y
      @resultVector = new Vector 0, 0
      @flowVector = new Vector 0,0
      @speed = 0.1
    
    
