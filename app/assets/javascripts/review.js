$(document).ready(function(){
  $("#slider").change(function(){
    var newValue = $('#slider').val();
    $("#rating_value").html(newValue);
  });
});


