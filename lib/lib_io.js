//libIO - v. 2015-01-23

var input = {
  KEY: {
    87:'W', 65:'A', 83:'S', 68:'D',
    38:'UP', 39:'RIGHT', 40:'DOWN', 37:'LEFT',
    13:'ENTER', 27:'ESC', 96:'NUMNULL', 8:'BACKSPACE', 32:'SPACE', 116:'F5' },

  lastkey: 0,
  lastkeys: [],

  mousehitbuffer: false,
  mousedown: false,
  mousex: false,
  mousey: false,

  setKey: function(keycode, active){
    input[keycode]=active;
    if(active){
      if(keycode in input.KEY){
        input.lastkeys[input.lastkeys.length] = keycode;
        input.lastkey = keycode;
        input[input.KEY[keycode]] = true;
      }else{
        console.log("Unknown key ["+keycode+"] pressed.");
      }
    }else{
      if(keycode in input.KEY){
        input.lastkey = (input.lastkeys.length-2>=0)? input.lastkeys[input.lastkeys.length-2]:0;
        input[input.KEY[keycode]] = false;
      }else{
        console.log("Unknown key ["+keycode+"] released.");
      }
    }
  },

  keypressed: function(e) {
    if(e.keyCode == 38 || e.keyCode == 39 || e.keyCode == 40 || e.keyCode == 37) e.preventDefault();
    input.setKey(e.keyCode, true);
  },

  keyreleased: function(e) {
    input.setKey(e.keyCode, false);
  },

  mouseup: function(){
    input['mousedown'] = false;
  },

  mousedown: function(){
    input['mousedown'] = true;
    input['mousehitbuffer'] = true;
  },

  mousehit: function(){
    var mhb = input['mousehitbuffer'];
    input['mousehitbuffer'] = false;
    return mhb;
  },

  flushmouse: function(){
    input['mousehitbuffer'] = false;
  },

  mousemove: function(e){
    input.mousex = e.pageX;
    input.mousey = e.pageY;
  }
};

//--- Events ---
window.onkeydown = input.keypressed;
window.onkeyup = input.keyreleased;
window.onmouseup = input.mouseup;
window.onmousedown = input.mousedown;
window.onmousemove = input.mousemove;
