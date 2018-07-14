/*
 * Copyright (c) 2018. Visionario
 */
$.ajaxSetup({ type:"POST",url:"./delete"});

$(".btn-danger").click(function (){
    var sel = $(this).parent().parent();
    $.ajax({
        data: {
            type:"usr",
            id: sel.children("th").text()
        },
        success: function() {
            sel.addClass("table-danger");
        }
    })
});
