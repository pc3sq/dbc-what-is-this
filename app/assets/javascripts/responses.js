$(document).ready( function () {

  $(document).on('click', '.upvote', function(event) {
    event.preventDefault();
    var responseId = $(this).data("id");
    $.ajax({
      url: '/responses/' + responseId + '/up_vote',
      type: 'POST',
      data: { id: responseId },
      success: function () {
        $('.responses-list').load(' .responses-list');
      },
      failure: function () {
        alert("You already voted for this response.");
      }
    });
  });


  $(document).on('click', '.mark-as-best', function(event) {
    event.preventDefault();
    var response_id = $(this).data("id");
    $.ajax({
      url: "/responses/" + response_id + '/mark_as_best',
      type: 'POST',
      data: { id: response_id },
      success: function(){
        console.log('good');
        $("div.responses-list").load(" div.responses-list");
      },
      failure: function(){
      }
    });
  });

});
