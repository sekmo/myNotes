// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$('document').ready(function() {
  $('.flash-wrapper').css('display', 'none');
  $('.flash-wrapper').css('transform', 'translate(-100px, 0);');
  setTimeout(function() {
    $('.flash-wrapper').fadeIn(400);
  }, 500);
  setTimeout(function() {
    $('.flash-wrapper').fadeOut();
  }, 3000);
});


// $('#current_item').animate({
//     opacity: 0
//   }, // what we are animating
//   'fast', // how fast we are animating
//   'swing', // the type of easing
//   function() { // the callback
//     alert('done');
//   });
