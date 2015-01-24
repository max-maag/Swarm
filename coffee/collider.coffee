require ['component'], (Component) ->
  class Collider extends Component
    constructor: (@boundingShape) ->
      @name = 'collider'
