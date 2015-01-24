define ["entityProcessingSystem","vector","position","acceleration","swarm"], (EntityProcessingSystem,Vector,Position,Acceleration,Swarm) ->
  class SwarmSystem extends EntityProcessingSystem
    constructor : () ->
      super ["position","acceleration","swarm"]
    
    processEntity : (e,dt) ->
      accx=0
      accy=0 
      list = Object.keys(@entities)
      for i in [0..9]
        index = Math.round(Math.random() * (list.length-1))
        o = @entities[list[index]]
        if(o==e)
          continue
        
        acc=0
        if(Vector.distSquared(e.position.vector,o.position.vector) > e.swarm.max * e.swarm.max)
          acc -= e.swarm.maxForce
        if(Vector.distSquared(e.position.vector,o.position.vector) < e.swarm.min * e.swarm.min)
          acc += e.swarm.minForce
        
        if(o.position.vector.x-e.position.vector.x>0 )
          accx -= Math.random() * acc
        else
          accx += Math.random() * acc  
        
        if(o.position.vector.y-e.position.vector.y>0 )
          accy -= Math.random() * acc
        else
          accy += Math.random() * acc
        
      e.acceleration.vector.x = accx
      e.acceleration.vector.y = accy