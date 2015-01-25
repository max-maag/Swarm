define ["component", "vector"], (Component, Vector) ->
  class Flow extends Component
    constructor: (x = 0, y = 0) ->
      @name = "flow" 
      @vector = new Vector x,y
      @range = 300
      @ang = 0.5
    
