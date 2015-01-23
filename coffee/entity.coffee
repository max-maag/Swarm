define [], () ->
  class Entity
    ###
     Creates an Entity
     @param  {vec2} @position entity position
    ###
    constructor: (@position) ->

    ###
     returns an string representation of the entity
     @return {string} a string containing relevant properties
    ###
    toString: () ->
      console.log "Entity { position: #{@position} }"
