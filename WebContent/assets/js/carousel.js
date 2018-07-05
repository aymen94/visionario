$('#myCarousel2').on('slide.bs.carousel', function (e) {

  
    var $e = $(e.relatedTarget);
    var idx = $e.index();
    var itemsPerSlide = 4;
    var totalItems = $('.carousel2').length;
    
    if (idx >= totalItems-(itemsPerSlide-1)) {
        var it = itemsPerSlide - (totalItems - idx);
        for (var i=0; i<it; i++) {
            if (e.direction=="left") {
                $('.carousel2').eq(i).appendTo('#carousel2');
            }
            else {
                $('.carousel2').eq(0).appendTo('#carousel2');
            }
        }
    }
});