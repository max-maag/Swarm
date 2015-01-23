require [
  "testModuleA"
  "testModuleB"
  "swarm",
  "entity"
], (A, B, Swarm, Entity) ->
  console.log "Main"

  swarm = new Swarm
  entity = new Entity [60,80]
  swarm.entities.push(entity)
  swarm.run()

  new A().run()
  new B().say "Hi!"
