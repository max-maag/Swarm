define ["component"], (Component) ->
  class Swarm extends Component
    constructor: () ->
      @name = "swarm" 
      @min = 30
      @max = 50
      @lose = 300
      @minForce = 1/10000
      @maxForce = 1/10000
    
