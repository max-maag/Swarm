define ['entityProcessingSystem', 'fpsCounter'], (EntityProcessingSystem, FpsCounter) ->
  class FpsCounterSystem extends EntityProcessingSystem
    constructor: (@container) ->
      super ['fpsCounter']
      @fps = 0
      @frameCount = 0
      @curSeconds = Date.now()
      
      
    onEntityAdded: (e) ->
      @container.addChild e.fpsCounter.view
      
    onEntityRemoved: (e) ->
      @container.removeChild e.fpsCounter.view
      
    process: (dt) ->
      if (Date.now() - @curSeconds < 1000)
        @frameCount++
      else
        @fps = @frameCount
        @frameCount = 1
        @curSeconds = Date.now()
        super dt # only call processEntity when fps changed
      
    processEntity: (e, dt) ->
      e.fpsCounter.view.setText "#{@fps} FPS"
