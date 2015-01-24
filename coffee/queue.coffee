define [], () ->
  class Queue
    constructor: () ->
      @data = []
    
    flip: () ->
      tmp = []
      while @data.length > 0
        tmp.push @data.pop
        
      @data = tmp
      
    push: (v) -> @data.push v
      
    pop: () -> @data.pop
    
    isEmpty: () -> @data.length == 0
