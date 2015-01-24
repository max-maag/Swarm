//libIO - v. 2015-01-24

var input = (function(){
  var scope = {};

  var curKey  = -1;
  var lastKey = -1;
  var keydownbuffer = {};
  var keyhitbuffer = {};
  var keycodes = {
    87:'W', 65:'A', 83:'S', 68:'D',
    38:'UP', 39:'RIGHT', 40:'DOWN', 37:'LEFT',
    13:'ENTER', 27:'ESC', 96:'NUMNULL', 8:'BACKSPACE', 32:'SPACE', 116:'F5'
  };
  var keynames = {};
  scope.KEY = keynames;

  var mousehitbuffer = false;
  var mousedown = false;
  var mousex = -1;
  var mousey = -1;

  var init = function() {
    for (keycode in keycodes){
      keydownbuffer[keycode] = false;
      keynames[keycodes[keycode]] = keycode;
    }

    //--- Events ---
    window.onkeydown = keypressed;
    window.onkeyup = keyreleased;
    window.onmouseup = setMouseUp;
    window.onmousedown = setMouseDown;
    window.onmousemove = mousemove;

    console.log("lib_io initialised.");
  };
  scope.init = init;


  function setKey(keycode, active){
    //keydownbuffer[keycode] = active;
    if(active) {
      if(keycode in keycodes){
        //input.lastkeys[input.lastkeys.length] = keycode;
        lastkey = curKey;
        curKey = keycodes[keycode];
        if (!keydownbuffer[keycode]) keyhitbuffer[keycode] = true;
        keydownbuffer[keycode] = true;
      } else {
        console.log("Unknown key ["+keycode+"] pressed.");
      }
    } else {
      if(keycode in keycodes){
        //input.lastkey = (input.lastkeys.length > 1)? input.lastkeys[input.lastkeys.length-2]:0;
        keydownbuffer[keycode] = false;
      } else {
        console.log("Unknown key ["+keycode+"] released.");
      }
    }
  }

  function keypressed(e) {
    if(e.keyCode == 38 || e.keyCode == 39 || e.keyCode == 40 || e.keyCode == 37) e.preventDefault();
    setKey(e.keyCode, true);
  }

  function keyreleased(e) {
    setKey(e.keyCode, false);
  }

  function keydown(keycode){
    if (keycode in keydownbuffer) {
      return keydownbuffer[keycode];
    } else {
      return false;
    }
  }
  scope.keydown = keydown;

  function keyhit(keycode){
    return keyhitbuffer[keycode];
  }
  scope.keyhit = keyhit;

  function flushkeys(){
    keyhitbuffer = {};
  }
  scope.flushkeys = flushkeys;


  //--- MOUSE ---
  function mousemove(e){
    input.mousex = e.pageX;
    input.mousey = e.pageY;
  }

  function setMouseDown(){
    mousedown = true;
    mousehitbuffer = true;
  }

  function setMouseUp() {
    mousedown = false;
  }

  function mousedown() {
    return mousedown;
  }
  scope.mousedown = mousedown;

  function mousehit(){
    return mousehitbuffer;
  }
  scope.mousehit = mousehit;

  function flushmouse(){
    mousehitbuffer = false;
  }
  scope.flushmouse = flushmouse;

  return scope;
})();
