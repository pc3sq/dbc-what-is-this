$(document).ready( function () {
  $("button.upvote").click( function() {
    var commentId = $(".upvote").data("id");
    event.preventDefault();
    $.ajax({
      url: '/response/up_vote',
      method: 'POST',
      data: { id: commentId },
      dataType: 'JSON'
    }).done( function (response) {
    }).fail( function (response) {
        console.log(response);
    })
  })
})
