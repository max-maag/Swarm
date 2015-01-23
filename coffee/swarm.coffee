define [], () ->
  class Swarm
    ###
     Swarm class containing entities
    ###
    constructor: () ->
      @entities = []

    ###
     updates all entities of the swarm
    ###
    update: () ->
      entity.toString() for entity in @entities
