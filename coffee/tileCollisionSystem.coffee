define [
  'entityProcessingSystem'
  'vector'
], (EntityProcessingSystem, Vector) ->
  class TileCollisionSystem extends EntityProcessingSystem
    constructor: (@map) ->
      super ['position', 'velocity']
    
    processEntity: (e, dt) =>
      p    = e.position.vector
      v    = e.velocity.resultVector
      #negV = Vector.mul v -1
      
      chunkPos = @map.toChunkOffset(p).sub @map.position
      chunk    = @map.chunks[chunkPos.x]?[chunkPos.y]
      if !chunk?
        #if Math.random() < 0.01
          #console.log "invalid chunk #{chunkPos.x}, #{chunkPos.y}: entity at #{p.x}, #{p.y}"
        return
      
      tilePos  = chunk.toTileOffset p
      tile     = chunk.tiles[tilePos.x]?[tilePos.y]
      
      if !tile?
        console.log "invalid tile index#{tilePos.x}, #{tilePos.y} (chunk pos: #{chunk.tiles[0][0].pos.x}, #{chunk.tiles[0][0].pos.y}) in chunk #{chunkPos.x}, #{chunkPos.y}: entity at #{p.x}, #{p.y}"
        return
      
      #console.log "entity at #{p.x}, #{p.y} in chunk #{chunkPos.x}, #{chunkPos.y}"
      
      log = Math.random() > 0.01
      
      if tile.isWall
        # determine direction out of tile
        ###
        tmp = new Vector(tile.pos).add(tile.size/2, tile.size/2)
        tmp.sub(p).mul(-1)
        
        if(log)
          console.log "diff: (#{tmp.x}, #{tmp.y})"
        ###
        ###
        tmp = new Vector(v).mul(-1)
        
        offset = 10
        if Math.abs(tmp.x) > Math.abs(tmp.y)
          if(tmp.x>0)
            tmp.x = tile.pos.x + tile.size - p.x + offset
          else
            tmp.x = tile.pos.x - p.x - offset
          tmp.y = 0
        else
          tmp.x = 0
          if(tmp.y>0)
            tmp.y = tile.pos.y + tile.size - p.y + offset
          else
            tmp.y = tile.pos.y - p.y - offset
        
        if(log)
          console.log "pushing + (#{tmp.x}, #{tmp.y})"
        # move
        p.add tmp
        ###
        p.add(new Vector(v).mul(-dt))
        
    ###
    lineLineIntersect: (p0, d0, p1, d1) ->
      tmp = new Vector()
      tmp.set(d0).sub d1
      if tmp.lengthSquared < 0.01
        return null #parallel
        
      return tmp.set (
    ###
