$(document).ready( function () {
  $(".upvote").click( function() {
    var responseId = $(".upvote").data("id");
    event.preventDefault();
    $.ajax({
      url: '/response/up_vote',
      method: 'POST',
      data: { id: responseId },
      dataType: 'JSON'
    }).done( function (voteCount) {
      if (voteCount == 1) {
        $("span[data-id=" + responseId + "]").html(voteCount + " vote");
      } else {
        $("span[data-id=" + responseId + "]").html(voteCount + " vote");
      }
    }).fail( function (voteCount) {
        console.log("Failed. Here is the voteCount:");
        console.log(voteCount);
    })
  })
})
