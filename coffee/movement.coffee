define ["entityProcessingSystem","position","velocity", "acceleration","vector"], (EntityProcessingSystem,Position,Velocity,Acceleration,Vector) ->
  class Movement extends EntityProcessingSystem
    
    constructor : () ->
      super ["position", "velocity"]
    
    processEntity : (e,dt) => 
      e.velocity.vector.add Vector.mul(e.acceleration.vector, dt)
      e.velocity.resultVector.set (Vector.add( e.velocity.vector.mul(e.velocity.speed/e.velocity.vector.length())  ,  e.velocity.flowVector ))
      #console.log e.velocity.flowVector
      e.position.vector.add( Vector.mul(e.velocity.resultVector, dt))
      #e.position.vector.add(Vector.add(Vector.mul(e.velocity.vector.mul(e.velocity.speed/e.velocity.vector.length(), e.velocity.flowVVector), dt)))
      e.velocity.flowVector.set(0, 0)
