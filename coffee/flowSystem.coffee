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
        console.log ang
        if(dist < e.flow.range and ang <= -e.flow.ang)
          s.position.vector.add(Vector.mul(e.flow.vector,dt * (1 - dist/e.flow.range)))
        
