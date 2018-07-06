$(function () {
  $('a[href="#search"]').on('click', function(event) {
      $('#search').addClass('open');
  });
  
  $('#search').on('transitionend webkitTransitionEnd oTransitionEnd otransitionend MSTransitionEnd', 
        function() {
    $('#search form input').focus();
    });

  $('#search, #search button.close').on('click keyup', function(event) {
      if (event.target == this || event.keyCode == 27) {
          $(this).removeClass('open');
      }
  });
});

var x = window.matchMedia("(max-width: 412px)")

$('#navbarNavDropdown').on('show.bs.collapse', function () {
    if(x.matches)
    $('#smalltitle').fadeOut("fast", function() {
    $('#cartbtn, #wishbtn, #searchbtn').fadeIn('fast')
    });
});

$('#navbarNavDropdown').on('hide.bs.collapse', function () {
    if(x.matches)
    {
    $('#cartbtn, #wishbtn, #searchbtn').each(function( index, element ) {
    if (!$( this ).css('display') == "inline" );
            $(this).css('display', '');
    })
    $('#smalltitle').fadeIn("fast");
    }
});
