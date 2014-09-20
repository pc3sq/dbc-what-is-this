$(document).ready( function () {
  $("button.upvote").click( function() {
    var commentId = $(".upvote").data("id");
    event.preventDefault();
    // alert("Hi, I am data id: " + commentId)
    $.ajax({
      url: '/response/up_vote',
      method: 'POST',
      data: { id: commentId }
    }).done( function (response) {
      // var selector = "span[data-id=" + responseId + "]";
      // $(selector).html(response);
      alert("Success! Here is your response: " + response);
    }).fail( function (response) {
        console.log(response);
      // console.log("Failed");
    })
  })
})
