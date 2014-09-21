$(document).ready( function () {
  $(".upvote").click( function() {
    var commentId = $(".upvote").data("id");
    event.preventDefault();
    $.ajax({
      url: '/response/up_vote',
      method: 'POST',
      data: { id: commentId },
      dataType: 'JSON'
    }).done( function (voteCount) {
      if (voteCount == 1) {
        $("span[data-id=" + commentId + "]").html(voteCount + " vote");
      } else {
        $("span[data-id=" + commentId + "]").html(voteCount + " vote");
      }
    }).fail( function (failureInfo) {
        console.log("Failed. Here is why:");
        console.log(failureInfo.responseText);
    })
  })
})
