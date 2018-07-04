$(document).ready(function($) {
    
    function rem() {
        var html = document.getElementsByTagName('html')[0];

        
            return parseInt(window.getComputedStyle(html)['fontSize']);
    };
  
    function getUrlParameter(sParam) {
        var sPageURL = decodeURIComponent(window.location.search.substring(1)),
            sURLVariables = sPageURL.split('&'),
            sParameterName,
            i;

        for (i = 0; i < sURLVariables.length; i++) {
            sParameterName = sURLVariables[i].split('=');

            if (sParameterName[0] === sParam) {
                return sParameterName[1] === undefined ? true : sParameterName[1];
            }
        }
    };
    
    $(".collapse").on("shown.bs.collapse",function(event){     
        event.preventDefault();
        $('html,body').animate({scrollTop:$(this).parent().offset().top-3.5*rem()}, 500);
    });
    
    if(getUrlParameter("address")>=0)
        {
            $("#collapse"+getUrlParameter("address")).collapse()
        }
});

$(".save").click(
    function (e) {
        e.preventDefault();
        $.ajax({
            type:"POST",
            data: {

                update: $("this").children("[name='id']"),
                city: $("this").children("[name='city']"),
                country: $("this").children("[name='country']"),
                province: $("this").children("[name='province']"),
                city: $("this").children("[name='city']"),
                zip: $("this").children("[name='zip']"),
                addressLine: $("this").children("[name='addressLine']"),
                consignee: $("this").children("[name='consignee']"),
                phoneNumber: $("this").children("[name='phoneNumber']")
            },
            url:"./address",
            success: function(res) {
                    $(".modal-title").text(res.title);
                    $(".modal-body").text(res.response);
                    $("#myModal").modal('show');

                    if(res.title=="success")
                      setTimeout(function(){window.location = '#';},2000);
                }
        })
})

$(".remove").click(
    function (e) {
        e.preventDefault();
        $.ajax({
            type:"POST",
            data: {

                remove: $("this").children("[name='id']")
            },
            url:"./address",
            success: function(res) {
                    $(".modal-title").text(res.title);
                    $(".modal-body").text(res.response);
                    $("#myModal").modal('show');

                    if(res.title=="success")
                      setTimeout(function(){location.reload(true);},2000);
                }
        })
})

$("#saveNew").click(
    function (e) {
        e.preventDefault();
        $.ajax({
            type:"POST",
            data: {
                insert: $("this").children("[name='id']"),
                city: $("this").children("[name='city']"),
                country: $("this").children("[name='country']"),
                province: $("this").children("[name='province']"),
                city: $("this").children("[name='city']"),
                zip: $("this").children("[name='zip']"),
                addressLine: $("this").children("[name='addressLine']"),
                consignee: $("this").children("[name='consignee']"),
                phoneNumber: $("this").children("[name='phoneNumber']")
            },
            url:"./address",
            success: function(res) {
                    $(".modal-title").text(res.title);
                    $(".modal-body").text(res.response);
                    $("#myModal").modal('show');

                    if(res.title=="success")
                      setTimeout(function(){location.reload(true);},2000);
                }
        })
})