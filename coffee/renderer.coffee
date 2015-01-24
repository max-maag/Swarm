define ["entityProcessingSystem", "position","render"], (EntityProcessingSystem,Position,Render) ->
  class Renderer extends EntityProcessingSystem
  
    constructor : (@container) ->
      super [Position, Render]
    
    processEntity : (e,dt) -> 
      e.render.sprite.x = e.position.x
      e.render.sprite.y = e.position.y
    
    onEntityAdded: () ->
      container.addChild sprite
    
    onEntityRemoved: () ->
      container.removeChild sprite
