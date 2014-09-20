$(document).ready( function () {
  $("button.add_comment").click( function() {
    var responseId = $(".response").data("id");
    event.preventDefault();
    $.ajax({
      url: '/comments/new',
      method: 'POST',
      data: { id: $(this).data("id") }
    }).done( function (response) {
      var selector = "span[data-id=" + targetId + "]";
      $(selector).html(response);
      alert("Success!");
    }).fail( function (response) {
      console.log("Failed");
    })
  })
})
