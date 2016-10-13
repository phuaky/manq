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
// = require jquery
// = require jquery_ujs
// = require_tree .
// = require semantic-ui

$(document).ready(function (){
  $('.ui.sidebar')
    .sidebar({
      context: $('.bottom.segment')
    })
    .sidebar('attach events', '.menu .item')
  ;

  $('.ui.dropdown').dropdown();

  $('table').tablesort();

  $('#manq-login-submit').click(function() {
    $('#login-modal').modal({inverted: true}).modal('show');
  });

  $('#manq-newbiz-create').click(function() {
    $('#newbiz-modal').modal({inverted: true}).modal('show');
  });

//CHECK STATUS OF CUSTOMER'S QUEUES
  $('#check-status').click(function() {

    $('.coupled.modal').modal({allowMultiple: false});
    $('#return-status-modal').modal('attach events', '#check-status-modal .button');
    $('#check-status-modal').modal('show');
    $('#check-status-modal').on('click','.button',function(event) {
      event.preventDefault();

      $.ajax({
        method: "GET",
        url: "/customers/queue_status/" + $('#check-status-modal').find('input').val(),
        success: function(serverResponse) {
          $('#return-status-modal').find('.content').empty();
          for(var i=0; i<serverResponse.length; i++) {
            string = "<i class='sign in horizontally flipped icon'></i>";
            for(var j=0; j<serverResponse[i].id; j++) {
              if(j==serverResponse[i].status_id){
                string += "<i class='orange male icon' style='margin:-3px'></i>";
              } else {
                string += "<i class='black male icon' style='margin:-3px'></i>";
              }
            }
            for(var j=serverResponse[i].id; j<20; j++) {
              // string += "<i class='inverted male icon' style='margin:-3px'></i>";
            }

            $('#return-status-modal').find('.content').append(
              '<h3 class="ui top attached header">'+serverResponse[i].store.biz_user.company_name+'<div class="sub header">'+serverResponse[i].store.store_name+'</div></h3>'+
              '<div class="ui attached secondary segment">'+string+
              '<br><i class="wait icon"></i>'+serverResponse[i].user_id+' mins</div>'
            );
          }
        },
        error: function(error) {
          console.log("Error:", error)
        }
      });
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
    $('#join-queue-modal').modal({inverted: true}).modal('show');
  });

  //Stores show page - changing queue status of customer
  $("a[data-action]").click(function (){
    $.ajax({
      method: "PATCH",
      url: "/customers/" + $(this).attr('id'),
      data: {type: $(this).attr('data-action'), status: $(this).attr('class'), customer_id: $(this).attr('id')},
      success: function(serverResponse) {
        window.location.href = "";
      },
      error: function(error) {
        console.log("Error:", error)
      }
    });
  })

  //Stores show page - edit store details
  $('#update-store-submit').click(function() {
    $('#update-store-modal').modal({inverted: true}).modal('show');
  });

  //Stores show page - edit store details
  $('#new-store-submit').click(function() {
    $('#new-store-modal').modal({inverted: true}).modal('show');
  });


});
