define ["entityProcessingSystem","position","velocity", "acceleration","vector"], (EntityProcessingSystem,Position,Velocity,Acceleration,Vector) ->
  class Movement extends EntityProcessingSystem
    
    constructor : () ->
      super ["position", "velocity"]
    
    processEntity : (e,dt) => 
      e.acceleration.vector.add (Math.random()*2-1)/10000, (Math.random()*2-1)/10000
      e.velocity.vector.add Vector.mul(e.acceleration.vector, dt)
      #e.velocity.vector.x *=(0.8 + Math.random() * 0.4)
      #e.velocity.vector.y *=(0.8 + Math.random() * 0.4)
      e.position.vector.add Vector.mul(e.velocity.vector, dt)
