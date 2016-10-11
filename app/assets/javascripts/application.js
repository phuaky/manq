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
//= require_tree .
//= require semantic-ui

$(document).ready(function (){
  $('.ui.dropdown').dropdown();

  $('#manq-login-submit').click(function() {
    $('#login-modal').modal({blurring: true}).modal('show');
  });


  $('#check-status').click(function() {

    $('.coupled.modal').modal({allowMultiple: false});
    $('#return-status-modal').modal('attach events', '#check-status-modal .button');
    $('#check-status-modal').modal({blurring: true}).modal('show');
    $('#check-status-modal').on('click','.button',function(event) {
      event.preventDefault();
    });
  });

  $('.ui.fluid.card').hover(
    function() {
      $(this).addClass('raised')
    },
    function() {
      $(this).removeClass('raised')
    }
  );

  // Index page js
  // Join Queue modal trigger
  $('.join-queue').click(function() {
    $('#join-queue-modal').find('.header').text('Join Queue - ' + $(this).parent().parent().find('.header').text() + ' - ' + $(this).parent().parent().find('.date').text());
    $('#join-queue-modal').find('form').append("<input type='hidden' name='store_id' value='"+$(this).attr('id')+"'>");
    $('#join-queue-modal').modal({blurring: true}).modal('show');

  });
});
