define ["entityProcessingSystem", "position","render"], (EntityProcessingSystem,Position,Render) ->
  class Renderer extends EntityProcessingSystem
  
    constructor : (@container) ->
      super ["position", "render"]
    
    processEntity : (e,dt) -> 
      e.render.sprite.position.x = e.position.vector.x - e.render.sprite.width/2
      e.render.sprite.position.y = e.position.vector.y - e.render.sprite.height/2
      
    
    onEntityAdded: (e) =>
      @container.addChild e.render.sprite
      #console.log "sprite added"
    
    onEntityRemoved: (e) =>
      @container.removeChild e.render.sprite
