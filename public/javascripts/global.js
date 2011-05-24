var INSTASHEET = (function($,d,undefined){

  // small helpers and app specific stuff goes here
  // not for full blown custom functionality
  var app = ({

    init : function() {
      return this;
    },

    flash : function() {
      setTimeout(function(){
        $('#flash_message').fadeOut(1000);
      },3000);
    },

  }).init();

  //larger functionality can go here

  // use module pattern (http://www.wait-till-i.com/2007/08/22/again-with-the-module-pattern-reveal-something-to-the-world/) to expose only public functions
  return {
    flash: app.flash
  };

})(window.jQuery,document);