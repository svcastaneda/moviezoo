$(function() {
	$('.button-collapse').sideNav();
	
	return $("#new_review_form").on("ajax:success", function(e, data, status, xhr) {
		console.log(e);
		values = e.target;
		review_content = values[1].value
		
		if (review_content.length > 0) {
    	return $(".reviews_section").append(xhr.responseText);
  }}).on("ajax:error", function(e, xhr, status, error) {
		console.log(e, xhr);
    return $("#new_review_form").append("<p>ERROR</p>");
  });
});