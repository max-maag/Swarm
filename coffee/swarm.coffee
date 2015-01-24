define ["component"], (Component) ->
  class Swarm extends Component
    constructor: () ->
      @name = "swarm" 
      
      @min = 20
      @max = 30
      @minForce = 1/20000
      @maxForce = 1/10000
    
