$(document).ready( function () {
  $('#signup').click(function(event){
    event.preventDefault();
    $('#screen_block').show();
    $('#signup_modal').show();
  });

  $('#screen_block').click(function(event){
    event.preventDefault();

    $('#screen_block').hide();
    $('#login_modal').hide();
    $('#signup_modal').hide();
    $('#new_question_modal').hide();
  });

  $('#login').click(function(event){
    event.preventDefault();
    $('#screen_block').show();
    $('#login_modal').show();
  });

   $('.new_question').click(function(event){
    event.preventDefault();
    $('#screen_block').show();
    $('#new_question_modal').show();
  });
});