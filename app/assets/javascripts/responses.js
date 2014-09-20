$(document).ready( function () {
  $("button.upvote").click( function() {
    var commentId = $(".upvote").data("id");
    event.preventDefault();
    alert("I am here")
    // $.ajax({
    //   url: '/upvote',
    //   data: { id: commentId }
    // }).done( function (response) {
    //   var selector = "span[data-id=" + responseId + "]";
    //   $(selector).html(response);
    //   alert("Success!");
    // }).fail( function (response) {
    //   console.log("Failed");
    // })
  })
})
