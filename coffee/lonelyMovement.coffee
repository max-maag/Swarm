define ["entityProcessingSystem","position","velocity", "acceleration", "lonely","vector"], (EntityProcessingSystem,Position,Velocity,Acceleration, Lonely,Vector) ->
  class LonelyMovement extends EntityProcessingSystem
    
    constructor : () ->
      super ["position","acceleration", "lonely"]
    
    processEntity : (e,dt) -> 
      if(e.lonely.time <= 0)
        e.lonely.vector.x = -1/3000 + 2* Math.random()/3000
        e.lonely.vector.y = -1/3000 + 2* Math.random()/3000
        e.lonely.time = 300 + Math.random() * 500
      
      e.lonely.time -= dt
      e.acceleration.vector.add(e.lonely.vector)
      
