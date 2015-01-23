require [
  "testModuleA"
  "testModuleB"
], (A, B) ->
  console.log "Main"
  new A().run()
  new B().say "Hi!"
