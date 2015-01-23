define [], () ->
  class Entity
    constructor: (@position) ->

    toString: () ->
      console.log "Entity { position: #{@position} }"
