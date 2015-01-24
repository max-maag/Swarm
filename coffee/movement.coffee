define ["entityProcessingSystem","position","velocity", "acceleration","vector"], (EntityProcessingSystem,Position,Velocity,Acceleration,Vector) ->
  class Movement extends EntityProcessingSystem
    
    constructor : () ->
      super ["position", "velocity"]
    
    processEntity : (e,dt) -> 
      e.velocity.vector.add(Vector.mul(e.acceleration.vector, dt))
      e.position.vector.add(Vector.mul(e.velocity.vector, dt))
