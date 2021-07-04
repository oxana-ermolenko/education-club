// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require rails-ujs
//= require jquery
//= require activestorage
//= require turbolinks
//= require_tree .
//= require semantic-ui
//= require semantic-ui/modal
//= require semantic-ui/dropdown
//= require cable

$(document).on('turbolinks:load', function() {
  $('.btnModal').on('click', function() {
    $('.ui.modal')
      .modal('setting', 'transition', 'vertical flip')
      .modal('show');
  });
  $('.btnModalEdit').on('click', function() {
    $('.ui.modal.edit')
      .modal('setting', 'transition', 'vertical flip')
      .modal('show');
  });
  $('.btnModalEditTask').on('click', function() {
    $('.ui.modal.editTask')
      .modal('setting', 'transition', 'vertical flip')
      .modal('show');
  });
  $('.btnModalAddTaskBacklog').on('click', function() {
    $('.ui.modal.addTaskBacklog')
      .modal('setting', 'transition', 'vertical flip')
      .modal('show');
  });
  $('.btnModalAddTaskDone').on('click', function() {
    $('.ui.modal.addTaskDone')
      .modal('setting', 'transition', 'vertical flip')
      .modal('show');
  });
  $('.btnModalAddTaskInProgress').on('click', function() {
    $('.ui.modal.addTaskInProgress')
      .modal('setting', 'transition', 'vertical flip')
      .modal('show');
  });
  $('.btnModalAddTaskInReview').on('click', function() {
    $('.ui.modal.addTaskInReview')
      .modal('setting', 'transition', 'vertical flip')
      .modal('show');
  });
  $('.btnModalAdd').on('click', function() {
    $('.ui.mini.modal.add')
      .modal('setting', 'transition', 'vertical flip')
      .modal('show');
  });
  
  $('.ui.dropdown').dropdown();
  $('.activating.element').popup();
});
