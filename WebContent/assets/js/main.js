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

$('#navbarNavDropdown').on('show.bs.collapse', function () {
    $('#smalltitle').css('display', 'none');
    $('#cartbtn, #wishbtn, #searchbtn').css('display', 'inline');
});

$('#navbarNavDropdown').on('hidden.bs.collapse', function () {
    $('#smalltitle').css("display", '');
    $('#cartbtn, #wishbtn, #searchbtn').each(function( index, element ) {
    if (!$( this ).css('display') == "inline" );
            $(this).css('display', '');
    })
});
