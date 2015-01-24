define ["entityProcessingSystem","position","velocity","vector"], (EntityProcessingSystem,Position,Velocity,Vector) ->
  class Movement extends EntityProcessingSystem
    
    constructor : () ->
      super ["position", "velocity"]
    
    processEntity : (e,dt) -> 
      e.position.vector.add(Vector.mul(e.velocity.vector, dt))
