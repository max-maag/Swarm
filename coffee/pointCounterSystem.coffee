define ['entityProcessingSystem', 'fpsCounter', 'vector'], (EntityProcessingSystem, FpsCounter,Vector ) ->
  class PointCounterSystem extends EntityProcessingSystem
    constructor: (@container, @swarmSystem) ->
      super ['pointCounter']
      @points = 0
      
    onEntityAdded: (e) ->
      @container.addChild e.pointCounter.view
      
    onEntityRemoved: (e) ->
      @container.removeChild e.pointCounter.view
      
    process: (dt) ->
      if (Date.now() - @curSeconds < 1000)
        5
      else
        super dt # only call processEntity when fps changed
      
    processEntity: (e, dt) ->
      e.pointCounter.view.setText "Points: #{@points}"
      temp = 0
      for i in Object.keys(@swarmSystem.entities)
        s = @swarmSystem.entities[i]
        vec = Vector.sub(e.position.vector,s.position.vector)
        dist2 = Vector.distSquared(e.position.vector,s.position.vector)
        dist = Math.sqrt(dist2)
        temp += Math.round(dist / 100)
          
      @points = temp
