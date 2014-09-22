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

  $('.new-question-button').click(function(event){
    event.preventDefault();
    $('#screen_block').show();
    $('#new_question_modal').show();
  });

  $('input[value="Add Comment"]').click(function(e){
    e.preventDefault();
    $(this).next().slideToggle('fast');
  });

  $(document).on('click', 'input[value="Create Response"]', function(e){
    e.preventDefault();
    var comment_form = $(this).data();
    $("#new_comment[data-response-id='"+ comment_form.responseId +"']").slideToggle('fast');
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
//
  $('form#new_response').submit(function(event){
    event.preventDefault();
    $('form#new_response input[type="submit"').prop('disable', true);
    var ajax_path = $('input[value="Add Comment"]').attr('href');
    $.ajax({
      url: ajax_path,
      type: 'POST',
      data: $('form#new_response').serialize(),
    }).done(function(data){
        $('.responses-list').load(' .responses-list');
        $('#new_response').slideToggle('fast');
        $('form#new_response').trigger('reset');
        $('form#new_response input[type="submit"').prop('disable', false);
    }).fail(function(data){
        $('form#new_response').trigger('reset');
        $('form#new_response input[type="submit"').prop('disable', false);
    });
  });
  $(document).on('submit', "form#new_comment", function(event){
    event.preventDefault();
    $('form#new_comment input[type="submit"').prop('disable', true);
    var ajax_path = $(this).attr('action');
    $.ajax({
      url: ajax_path,
      type: 'POST',
      data: $(this).serialize(),
    }).done(function(data){
        $('.responses-list').load(' .responses-list');
        $('form#new_comment input[type="submit"').prop('disable', false);
    }).fail(function(data){
        $('form#new_comment').trigger('reset');
        $('form#new_comment input[type="submit"').prop('disable', false);
    });
  });
});
function setHeader(xhr) {
    xhr.setRequestHeader("Accept", "application/json");
}

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
