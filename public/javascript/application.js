$(document).ready(function() {

  if ( $("#instagram_button").is(":visible") ) {
    $('#login_nav').hide();
  } else {
    $('#login_nav').show();
  }

  if ( $("#error").is(":visible") ) {
    $("#review_form").css("margin-top", "10px");
  } else {
    $("#review_form").css("margin-top", "100px");
  } 

});
