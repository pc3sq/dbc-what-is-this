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

    }).fail( function (voteCount) {
        console.log("Failed. Here is the voteCount:");
        console.log(voteCount);
    })
  })
})
