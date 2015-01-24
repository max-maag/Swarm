define [], () ->
  class Component
  
    constructor: () ->
      @name = "default"
    
    toString: () -> @name
    
    addToEntity: (e) ->
      e[@name] = this
