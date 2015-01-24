var audioplayer = {
  tracks: [
    {isrc: "USUAN1200081", title: "Cephalopod",                     desc: "by Kevin MacLeod (<a href=\"http://incompetech.com\">incompetech.com</a>)<br>Licensed under <a href=\"http://creativecommons.org/licenses/by/3.0/\">Creative Commons: By Attribution 3.0</a>", src: {filename: "USUAN1200081_Cephalopod",                fileext: [".opus", ".ogg"]}},
    {isrc: "USUAN1100237", title: "Ether Disco",               	    desc: "by Kevin MacLeod (<a href=\"http://incompetech.com\">incompetech.com</a>)<br>Licensed under <a href=\"http://creativecommons.org/licenses/by/3.0/\">Creative Commons: By Attribution 3.0</a>", src: {filename: "USUAN1100237_Ether Disco",               fileext: [".opus", ".ogg"]}},
    {isrc: "USUAN1100240", title: "Enter the Party",           	    desc: "by Kevin MacLeod (<a href=\"http://incompetech.com\">incompetech.com</a>)<br>Licensed under <a href=\"http://creativecommons.org/licenses/by/3.0/\">Creative Commons: By Attribution 3.0</a>", src: {filename: "USUAN1100240_Enter the Party",           fileext: [".opus", ".ogg"]}},
    {isrc: "USUAN1100045", title: "The Way Out",               	    desc: "by Kevin MacLeod (<a href=\"http://incompetech.com\">incompetech.com</a>)<br>Licensed under <a href=\"http://creativecommons.org/licenses/by/3.0/\">Creative Commons: By Attribution 3.0</a>", src: {filename: "USUAN1100045_The Way Out",               fileext: [".opus", ".ogg"]}},
    {isrc: "USUAN1100374", title: "Future Cha Cha",                 desc: "by Kevin MacLeod (<a href=\"http://incompetech.com\">incompetech.com</a>)<br>Licensed under <a href=\"http://creativecommons.org/licenses/by/3.0/\">Creative Commons: By Attribution 3.0</a>", src: {filename: "USUAN1100374_Future Cha Cha",            fileext: [".opus", ".ogg"]}},
    {isrc: "USUAN1100568", title: "Rocket",                         desc: "by Kevin MacLeod (<a href=\"http://incompetech.com\">incompetech.com</a>)<br>Licensed under <a href=\"http://creativecommons.org/licenses/by/3.0/\">Creative Commons: By Attribution 3.0</a>", src: {filename: "USUAN1100568_Rocket",                    fileext: [".opus", ".ogg"]}},
    {isrc: "USUAN1100602", title: "Disco Lounge",                   desc: "by Kevin MacLeod (<a href=\"http://incompetech.com\">incompetech.com</a>)<br>Licensed under <a href=\"http://creativecommons.org/licenses/by/3.0/\">Creative Commons: By Attribution 3.0</a>", src: {filename: "USUAN1100602_Disco Lounge",              fileext: [".opus", ".ogg"]}},
    {isrc: "USUAN1100606", title: "Padanaya Blokov",                desc: "by Kevin MacLeod (<a href=\"http://incompetech.com\">incompetech.com</a>)<br>Licensed under <a href=\"http://creativecommons.org/licenses/by/3.0/\">Creative Commons: By Attribution 3.0</a>", src: {filename: "USUAN1100606_Padanaya Blokov",           fileext: [".opus", ".ogg"]}},
    {isrc: "USUAN1100631", title: "MTA",                            desc: "by Kevin MacLeod (<a href=\"http://incompetech.com\">incompetech.com</a>)<br>Licensed under <a href=\"http://creativecommons.org/licenses/by/3.0/\">Creative Commons: By Attribution 3.0</a>", src: {filename: "USUAN1100631_MTA",                       fileext: [".opus", ".ogg"]}},
    {isrc: "USUAN1100721", title: "Spazzmatica Polka",              desc: "by Kevin MacLeod (<a href=\"http://incompetech.com\">incompetech.com</a>)<br>Licensed under <a href=\"http://creativecommons.org/licenses/by/3.0/\">Creative Commons: By Attribution 3.0</a>", src: {filename: "USUAN1100721_Spazzmatica Polka",         fileext: [".opus", ".ogg"]}},
    {isrc: "USUAN1100741", title: "Pinball Spring",                 desc: "by Kevin MacLeod (<a href=\"http://incompetech.com\">incompetech.com</a>)<br>Licensed under <a href=\"http://creativecommons.org/licenses/by/3.0/\">Creative Commons: By Attribution 3.0</a>", src: {filename: "USUAN1100741_Pinball Spring",            fileext: [".opus", ".ogg"]}},
    {isrc: "USUAN1100790", title: "Silly Fun",                      desc: "by Kevin MacLeod (<a href=\"http://incompetech.com\">incompetech.com</a>)<br>Licensed under <a href=\"http://creativecommons.org/licenses/by/3.0/\">Creative Commons: By Attribution 3.0</a>", src: {filename: "USUAN1100790_Silly Fun",                 fileext: [".opus", ".ogg"]}},
    {isrc: "USUAN1200010", title: "Theme for Harold var 3",         desc: "by Kevin MacLeod (<a href=\"http://incompetech.com\">incompetech.com</a>)<br>Licensed under <a href=\"http://creativecommons.org/licenses/by/3.0/\">Creative Commons: By Attribution 3.0</a>", src: {filename: "USUAN1200010_Theme for Harold var 3",    fileext: [".opus", ".ogg"]}},
    {isrc: "USUAN1200015", title: "Latin Industries",               desc: "by Kevin MacLeod (<a href=\"http://incompetech.com\">incompetech.com</a>)<br>Licensed under <a href=\"http://creativecommons.org/licenses/by/3.0/\">Creative Commons: By Attribution 3.0</a>", src: {filename: "USUAN1200015_Latin Industries",          fileext: [".opus", ".ogg"]}},
    {isrc: "USUAN1200079", title: "Electrodoodle",                  desc: "by Kevin MacLeod (<a href=\"http://incompetech.com\">incompetech.com</a>)<br>Licensed under <a href=\"http://creativecommons.org/licenses/by/3.0/\">Creative Commons: By Attribution 3.0</a>", src: {filename: "USUAN1200079_Electrodoodle",             fileext: [".opus", ".ogg"]}},
    {isrc: "USUAN1200084", title: "Moon Lounge Omicron Prime",      desc: "by Kevin MacLeod (<a href=\"http://incompetech.com\">incompetech.com</a>)<br>Licensed under <a href=\"http://creativecommons.org/licenses/by/3.0/\">Creative Commons: By Attribution 3.0</a>", src: {filename: "USUAN1200084_Moon Lounge Omicron Prime", fileext: [".opus", ".ogg"]}},
    {isrc: "USUAN1200091", title: "Disco con Tutti",                desc: "by Kevin MacLeod (<a href=\"http://incompetech.com\">incompetech.com</a>)<br>Licensed under <a href=\"http://creativecommons.org/licenses/by/3.0/\">Creative Commons: By Attribution 3.0</a>", src: {filename: "USUAN1200091_Disco con Tutti",           fileext: [".opus", ".ogg"]}},
    {isrc: "USUAN1300006", title: "Go Cart",                        desc: "by Kevin MacLeod (<a href=\"http://incompetech.com\">incompetech.com</a>)<br>Licensed under <a href=\"http://creativecommons.org/licenses/by/3.0/\">Creative Commons: By Attribution 3.0</a>", src: {filename: "USUAN1300006_Go Cart",                   fileext: [".opus", ".ogg"]}},
    {isrc: "USUAN1300017", title: "Jaunty Gumption",                desc: "by Kevin MacLeod (<a href=\"http://incompetech.com\">incompetech.com</a>)<br>Licensed under <a href=\"http://creativecommons.org/licenses/by/3.0/\">Creative Commons: By Attribution 3.0</a>", src: {filename: "USUAN1300017_Jaunty Gumption",           fileext: [".opus", ".ogg"]}},
    {isrc: "USUAN1300028", title: "Exhilarate",                     desc: "by Kevin MacLeod (<a href=\"http://incompetech.com\">incompetech.com</a>)<br>Licensed under <a href=\"http://creativecommons.org/licenses/by/3.0/\">Creative Commons: By Attribution 3.0</a>", src: {filename: "USUAN1300028_Exhilarate",                fileext: [".opus", ".ogg"]}}
  ],

  config: {
    trackid: 0,
    audioElement: 0
  },

  init: function(){
    var audioElement = document.getElementsByClassName('audioplayer-audioelement')[0];
    audioplayer.config.audioElement = audioElement;

    $('.audioplayer .progressbar').mousedown(function(e){
      audioplayer.config.progressbarMousedown=true;
      audioplayer.updateProgress(e);
    });
    $(document).mouseup(function(){
      audioplayer.config.progressbarMousedown=false;
    });
    $(document).mousemove(function(e){
      audioplayer.updateProgress(e);
    });


    $('.audioplayer-playbutton').click(function(){
      if(audioElement.paused){
        audioElement.play();
      }else{
        audioElement.pause();
      }
    });
    $('.audioplayer-nextbutton').click(function(){
      audioplayer.playNextTrack();
    });
    $('.audioplayer-prevbutton').click(function(){
      audioplayer.playPrevTrack();
    });


    $('.audioplayer-volumebutton-volumebar').mousedown(function(e){
      audioplayer.config.volumebarMousedown=true;
      audioplayer.updateVolume(e);
    });
    $(document).mouseup(function(){
      audioplayer.config.volumebarMousedown=false;
    });
    $(document).mousemove(function(e){
      audioplayer.updateVolume(e);
    });


    audioElement.addEventListener('play', function(){
      $('.audioplayer-playbutton').removeClass('playbutton-paused');
      $('.audioplayer-playbutton').addClass('playbutton-playing');
    });
    audioElement.addEventListener('pause', function(){
      $('.audioplayer-playbutton').removeClass('playbutton-playing');
      $('.audioplayer-playbutton').addClass('playbutton-paused');
    });
    audioElement.addEventListener('ended', function(){
      audioplayer.playNextTrack();
    });

    audioElement.addEventListener('timeupdate', function(){
      $('.audioplayer .progressbar .bar').css('width', audioElement.currentTime/audioElement.duration*100+'%');
      $('.audioplayer-durationdesc').text(audioplayer.formatSeconds(audioElement.currentTime)+' / '+audioplayer.formatSeconds(audioElement.duration));
    });
    audioElement.addEventListener('volumechange', function(){
      $(".audioplayer-volumebutton-volumebar .bar").css('width', audioplayer.config.audioElement.volume*100+'%');
    });

    audioplayer.playTrack(0);
    audioplayer.config.audioElement.volume = 0.75;

  },

  updateVolume: function(e){
    if(audioplayer.config.volumebarMousedown){
      var volume = (e.pageX - $(".audioplayer .audioplayer-volumebutton-volumebar").offset().left)/($(".audioplayer .audioplayer-volumebutton-volumebar").width());
      if(volume<0) volume = 0;
      if(volume>1) volume = 1;
      audioplayer.config.audioElement.volume = volume;
    }
  },

  updateProgress: function(e){
    if(audioplayer.config.progressbarMousedown){
      var progress = (e.pageX - $(".audioplayer .progressbar").offset().left)/($(".audioplayer .progressbar").width());
      if(progress<0) progress = 0;
      if(progress>1) progress = 1;
      audioplayer.config.audioElement.currentTime = audioplayer.config.audioElement.duration*progress;
    }
  },

  playNextTrack: function(){ audioplayer.playTrack(++audioplayer.config.trackid); },
  playPrevTrack: function(){ audioplayer.playTrack(--audioplayer.config.trackid); },

  playTrack: function(trackid){
    if(trackid<0) trackid = audioplayer.tracks.length-1;
    if(trackid>=audioplayer.tracks.length) trackid = 0;
    audioplayer.config.trackid = trackid;

    var track = audioplayer.tracks[trackid];

    $('.audioplayer .head').html(
      '<span class="title">'+track.title+'</span>'
     +'<span class="desc">'+track.desc+'</span>');

    var sources = '';
    for(var fileextid in track.src.fileext){
      sources += '<source src="res/audio/'+track.src.filename+track.src.fileext[fileextid]+'" />';
    }

    var audioElement = audioplayer.config.audioElement;
    audioElement.pause();
    $('.audioplayer .body .audioplayer-audioelement').html(sources);
    audioElement.load();
    audioElement.play();
  },


  formatSeconds: function(sec){
    if(isNaN(sec)) return '0:00';
    var h = Math.floor(sec/3600);
    sec -= h*3600;
    var m = Math.floor(sec/60);
    var s = Math.floor(sec - m*60);

    if(h!=0){
      return h+':'+(m<10?'0':'')+m+':'+(s<10?'0':'')+s;
    }else{
      return m+':'+(s<10?'0':'')+s;
    }
  }
};
