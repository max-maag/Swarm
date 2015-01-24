define ['component'], (Component) ->
  class InputEvent extends Component
    constructor: (@event) ->
      @name = 'event'
      for k in Object.keys(@event)
        this[k] = @event[k]
