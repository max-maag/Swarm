define ["entityProcessingSystem","vector"], (EntityProcessingSystem,Vector) ->
  class FlowSystem extends EntityProcessingSystem
    
    constructor : (@swarmSystem) ->
      super ["position", "flow"]
    
    processEntity : (e,dt) -> 
      for i in Object.keys(@swarmSystem.entities)
        s = @swarmSystem.entities[i]
        vec = Vector.sub(e.position.vector,s.position.vector)
        dist = vec.length()
        ang = vec.dot(e.flow.vector) / dist / e.flow.vector.length()
        if(dist < e.flow.range and ang <= -e.flow.ang)
          s.velocity.flowVector.set(Vector.mul(e.flow.vector,(1 - dist/e.flow.range)))
          console.log "set flow vector"
        
