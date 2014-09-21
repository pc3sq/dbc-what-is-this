$(document).ready( function () {
  $(".upvote").click( function() {
    var commentId = $(".upvote").data("id");
    event.preventDefault();
    $.ajax({
      url: '/response/up_vote',
      method: 'POST',
      data: { id: commentId },
      dataType: 'JSON'
    }).done( function (response) {
      $(".upvote").closest(".response").append("<p>" + response + "</p>")
    }).fail( function (response) {
        console.log("Failed. Here is the response:")
        console.log(response);
    })
  })
})
