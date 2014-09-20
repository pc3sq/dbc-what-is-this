var commentForm =  '<form id="comment_form" action="/comments" method="POST" name="create_comment">
    <textarea name="comment_form[body]" placeholder="Write your comment here." required></textarea>
    <br>
    <input type="submit" value="Add This Comment">
  </form>'


function appendCommentForm () {
  $(".response").append(commentForm)
}


$(document).ready( function () {
  $("button.add_comment").click( function() {
    var responseId = $(".response").data("id");
    event.preventDefault();
    $.ajax({
      url: '/comments/new',
      method: 'POST',
      data: { id: $(this).data("id") }
    }).done( function (response) {
      var selector = "span[data-id=" + responseId + "]";
      $(selector).html(response);
      alert("Success!");
    }).fail( function (response) {
      console.log("Failed");
    })
  })
})
