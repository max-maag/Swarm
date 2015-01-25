define ["component", "vector"], (Component, Vector) ->
  class Lonely extends Component
    constructor: () ->
      @name = "lonely" 
      @time = 0
      @vector = new Vector 0,0
    
