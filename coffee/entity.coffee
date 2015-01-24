define [], () ->
  class Entity
    @IDs
    
    constructor: (components...) ->
      @id = @IDs++
      for c in components
        c.addToEntity this
