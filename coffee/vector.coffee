define [], () ->
  ###
    Methods like add, sub and dot can either take (number, number), (PIXI.Point) or (Vector).
  ###
  class Vector
    _handleArg: (v, handler) ->
      t = typeof v
      if handler[t]?
        handler[t]()
      else
        console.error "unexpected argument of type #{t}"

    ###
      args: (number, number), (PIXI.Point), or ()
    ###
    constructor: (x, y) ->
      @x = 0
      @y = 0

      @_handleArg x,
        'number': () => @set x, y
        'object': () => @set x.x, x.y
        'undefined': () => @set 0, 0

    # Member functions #

    foreach: (f) =>
      @x = f @x
      @y = f @y

    set: (x, y) =>
      @_handleArg x,
        'number': () =>
          @x = x
          @y = y
        'object': () =>
          @x = x.x
          @y = x.y

      return this

    add: (x, y) =>
      @_handleArg x,
        'number': () =>
          @x += x
          @x += y
        'object': () =>
          @x += x.x
          @y += x.y

      return this

    sub: (x, y) =>
      @_handleArg x,
        'number': () =>
          @x -= x
          @x -= y
        'object': () =>
          @x -= x.x
          @y -= x.y

      return this

    mul: (x) =>
      @x *= x
      @y *= x
      return this

    dot: (v) =>
      return @x * v.x + @y * v.y

    lengthSquared: () => @x * @x + @y * @y

    length: () => Math.sqrt @lengthSquared()
    
    normalize: () =>
      @mul 1/@length()

    toString: () =>
      "["+@x+","+@y+"]"
      
    slerp: (x, y, t) =>
      if !t?
        t = y
        
      v = @_handleArg x,
        'number': () -> 
        'object': () -> x.normalize()
        
      console.log v
        
      l = @length()
      @normalize()
      
      o = Math.acos @dot v
      so = Math.sin o
      @mul(Math.sin((1-t) * o) / so)
      @add v.mul(Math.sin(t*o) / so)
      
      @mul l

    # Static function #

    @add: (a, b, res = new Vector()) ->
      res.set(a).add(b)

    @sub: (a, b, res = new Vector()) ->
      res.set(a).sub(b)

    @mul: (a, b, res = new Vector()) ->
      res.set(a).mul(b)

    @dot: (a, b, res = new Vector()) ->
      res.set(a).dot(b)

    @dist: (a, b, res = new Vector()) ->
      res.set(a).sub(b).length()

    @distSquared: (a, b, res = new Vector()) ->
      res.set(a).sub(b).lengthSquared()
      
    @slerp: (a, b, t, res = new Vector()) ->
      res.set(a).slerp(b, t)
