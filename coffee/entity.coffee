define [], () ->
  class Entity
    @IDs = 0
    
    constructor: (components...) ->
      @id = Entity.IDs++
      for c in components
        c.addToEntity this
