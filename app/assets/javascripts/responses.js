$(document).ready( function () {

  $(document).on('click', ".upvote", function(event) {
    var responseId = $(this).data("id");
    event.preventDefault();
    $.ajax({
      url: '/response/up_vote',
      type: 'POST',
      data: { id: responseId },
      dataType: 'JSON'
    }).done( function (voteCount) {
      if (voteCount == 1) {
        $("span[data-id=" + responseId + "]").html(voteCount + " vote");
      } else {
        $("span[data-id=" + responseId + "]").html(voteCount + " vote");
      }
    }).fail( function (failureResponse) {
        alert("You already voted for this response.");
        console.log(failureResponse);
    });
  });

  $(document).on('click', '.mark-as-best', function(event){
    event.preventDefault();
    var response_id = $(this).data("id");
    $.ajax({
      url: "/responses/" + response_id,
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
