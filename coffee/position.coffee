define ["vector", "component"], (Vector, Component) ->
  class Position extends Component
    
    
    constructor: (x = 0, y = 0) ->
      @name = "Position" 
      @vector = new Vector x,y
      
    
    
    
    
    
