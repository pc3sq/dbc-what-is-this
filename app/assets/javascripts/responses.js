$(document).ready( function () {

  $(".upvote").click( function(event) {
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
    })
  })

  $(document).on('click', '.mark-as-best', function(event){
    event.preventDefault();
    var stuff = $(this).data("id");
    console.log('NATHAN')
    $.ajax({
      url: "/responses/" + stuff,
      type: 'POST',
      data: { id: stuff },
      success: function(){
        console.log('good');
        $("div.responses-list").load(" div.responses-list");
      },
      failure: function(){
        console.log('bad')
      }
    })
  })

})
