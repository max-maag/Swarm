require ["swarm", "entity", "map", "vector"], (Swarm, Entity, Map, Vector) ->
  console.log "SwarmMain"

  ###
  swarm = new Swarm
  entity = new Entity [60,80]
  swarm.entities.push(entity)
  swarm.run()
  ###

  pos = new Vector(0, 0)
  tres = 1
  dim = 4
  tilesize = 100


  map = new Map(pos, tres, dim, tilesize)
  console.log map.toString()
