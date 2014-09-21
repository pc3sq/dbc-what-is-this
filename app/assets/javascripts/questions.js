$(document).ready( function () {
  $('#signup').click(function(event){
    event.preventDefault();
    $('#screen_block').show();
    $('#signup_modal').show();
  });

  $('#screen_block').click(function(event){
    event.preventDefault();
    clear_modals();
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
    $('form#new_question input[type="submit"').prop('disable', true);
    $.ajax({
      url: '/questions',
      type: 'POST',
      data: $('form#new_question').serialize(),
      dataType: 'JSON',
    }).done(function(data){
        $('ol.thumb-grid').load('/ .thumb-grid');
        clear_modals();
        reset_question_form();
    }).fail(function(data){
        reset_question_form();
    });
  });
});

function reset_question_form(){
  $('form#new_question').trigger('reset');
  $('form#new_question input[type="submit"').prop('disable', false);
}

function clear_modals(){
  $('#screen_block').hide();
    $('#login_modal').hide();
    $('#signup_modal').hide();
    $('#new_question_modal').hide();
}