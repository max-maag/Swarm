define ["entityProcessingSystem","vector","position","acceleration","graviton"], (EntityProcessingSystem,Vector,Position,Acceleration,Graviton) ->
  class GravitonSystem extends EntityProcessingSystem
    constructor : (@swarmSystem) ->
      super ["position","graviton"]
    
    processEntity : (e,dt) ->
      for i in Object.keys(@swarmSystem.entities)
        s = @swarmSystem.entities[i]
        vec = Vector.sub(e.position.vector,s.position.vector)
        dist2 = Vector.distSquared(e.position.vector,s.position.vector)
        dist = Math.sqrt(dist2)
        if(dist2 < e.graviton.range * e.graviton.range)
          acc = e.graviton.force * dist / e.graviton.range
          s.acceleration.vector.x += acc * vec.x / dist 
          s.acceleration.vector.y += acc * vec.y / dist  
      
