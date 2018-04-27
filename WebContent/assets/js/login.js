$('#signupform').hide();

$('#login').click(function (e) {
  $('#signupform').hide();
  $('#loginform').show();
})

$('#signup').click(function () {
  $('#loginform').hide();
  $('#signupform').show();
})