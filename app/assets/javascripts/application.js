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
//= require material
//= require materialize-sprockets
//= require_tree .



function myFunction() {
    document.getElementById("myDialog").showModal();
}

$( document ).ready(function() {
  console.log('hello');
  var dialog = document.querySelector('dialog');
  var showDialogButton = document.getElementById('#show-dialog');
  if (! dialog.showModal) {
    dialogPolyfill.registerDialog(dialog);
  }

  showDialogButton.addEventListener('click', function() {
    console.log('hello');
    dialog.showModal();
  });
  dialog.querySelector('.close').addEventListener('click', function() {
    dialog.close();
  });

  console.log('bye');
});
