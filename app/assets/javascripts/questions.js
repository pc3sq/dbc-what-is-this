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

  $('.new_question_button').click(function(event){
    event.preventDefault();
    $('#screen_block').show();
    $('#new_question_modal').show();
  });
  $('form#new_question').submit(function(event){
    event.preventDefault();
    $.ajax({
      url: '/questions',
      type: 'POST',
      data: $('form#new_question').serialize(),
      dataType: 'JSON',
    }).done(function(data){
      $('ol.thumb-grid').load('/ .thumb-grid')
      clear_modals();
    }).fail(function(data){
      console.log(data);
    });
  });
});

function clear_modals(){
  $('#screen_block').hide();
    $('#login_modal').hide();
    $('#signup_modal').hide();
    $('#new_question_modal').hide();
}