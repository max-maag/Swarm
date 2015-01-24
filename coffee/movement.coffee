define ["entityProcessingSystem","position","velocity"], (EntityProcessingSystem,Position,Velocity) ->
  class Movement extends EntityProcessingSystem
    
    constructor : () ->
      super [Position, Velocity]
    
    processEntity : (e,dt) -> 
      e.position.vector.add(Vector.mul(e.velocity.vector, dt))
