$(function() {
  $("#new_review_form").on('submit', function() {
    return $("#new_review_form").on("ajax:success", function(e, data, status, xhr) {
    new_review_form = this;
    values = e.target;
    review_content = values[1].value

    if (review_content.length > 0) {
      new_review_form.remove();
      return $(".reviews_section").append(xhr.responseText);
  }}).on("ajax:error", function(e, xhr, status, error) {
    return $("#new_review_form").append("<p>ERROR</p>");
  });
  })



  $('ul.reviews_section').on('click', 'li > .vote', function(event) {
      event.preventDefault();
      event.stopPropogation();
      if ($(this).hasClass('new-pop')){
        var route = "/pops"
        var meth = "POST"
      } else {
        var route = "/pops"
        var meth = "POST"
      }

      var request = $.ajax({
        url: route,
        method: meth
      });
      request.done(function(response){

      })
  });
});
