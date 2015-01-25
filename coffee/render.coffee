define ["component"], (Component) ->
  class Render extends Component
  
    constructor: (@sprite) -> 
      @name = "render"
      #@sprite.anchor.set 0.5 0.5
      
