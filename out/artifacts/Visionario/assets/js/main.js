$(function () {
  $('a[href="#search"]').on('click', function(event) {
      $('#search').addClass('open');
      $('#search > form > input').focus();
  });
  
  $('#search, #search button.close').on('click keyup', function(event) {
      if (event.target == this || event.keyCode == 27) {
          $(this).removeClass('open');
      }
  });
});