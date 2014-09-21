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
<<<<<<< HEAD
    }).fail( function (failureInfo) {
        console.log("Failed. Here is why:");
        console.log(failureInfo.responseText);
=======
    }).fail( function (voteCount) {
        console.log("Failed. Here is the voteCount:");
        console.log(voteCount);
>>>>>>> a76a56efe80d8fc8fbcd580fa39d90ee5616421d
    })
  })
})
