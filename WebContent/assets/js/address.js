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

function check(x)
{
    if($(x).find("#city").val().length>0 && $(x).find("#country").val().length>0
         && $(x).find("#province").val().length>0
           && $(x).find("#city").val().length>0
            && $(x).find("#zip").val().length>0
            && $(x).find("#addressLine").val().length>0
            && $(x).find("#consignee").val().length>0
            && $(x).find("#phoneNumber").val().length>0){
        return true    
    }
    return false
}

$(".save").click(function (e) {
        
        e.preventDefault();
        var x=$(this).parent().parent().parent().children().children();
        
        if(check(x))
        $.ajax({
            type:"POST",
            data: {
                update: x.find("#id").val(),
                city: x.find("#city").val(),
                country: x.find("#country").val(),
                province: x.find("#province").val(),
                city: x.find("#city").val(),
                zip: x.find("#zip").val(),
                addressLine: x.find("#addressLine").val(),
                consignee: x.find("#consignee").val(),
                phoneNumber:x.find("#phoneNumber").val()
            },
            url:"./Address",
            success: function(res) {
                    $(".modal-title").text(res.title);
                    $(".modal-body").text(res.response);
                    $("#myModal").modal('show');

                    if(res.title=="success")
                      setTimeout(function(){window.location = './profile?address='+x.find("#id").val();},2000);
                }
        });
        else {
            $(".modal-title").text("Error");
            $(".modal-body").text("All fields must be filled in correctly");
            $("#myModal").modal('show');
            setTimeout(function(){$("#myModal").modal('hide');},2000);
        }
})

$(".remove").click(
    function (e) {
        e.preventDefault();
        var x=$(this).parent().parent().parent().children().children();
        
        $.ajax({
            type:"POST",
            data: {

                remove: x.find("#id").val()
            },
            url:"./Address",
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
        var x=$(this).parent().parent().parent().children().children();
        
        if(check(x))
        $.ajax({
            type:"POST",
            data: {
                insert: 1,
                city: x.find("#city").val(),
                country: x.find("#country").val(),
                province: x.find("#province").val(),
                city: x.find("#city").val(),
                zip: x.find("#zip").val(),
                addressLine: x.find("#addressLine").val(),
                consignee: x.find("#consignee").val(),
                phoneNumber:x.find("#phoneNumber").val()
            },
            url:"./Address",
            success: function(res) {
                    $(".modal-title").text(res.title);
                    $(".modal-body").text(res.response);
                    $("#myModal").modal('show');

                    if(res.title=="success")
                      setTimeout(function(){window.location = './profile?address='+res.id;},2000);


                }
        });
        else {
            $(".modal-title").text("Error");
            $(".modal-body").text("All fields must be filled in correctly");
            $("#myModal").modal('show');
            setTimeout(function(){$("#myModal").modal('hide');},2000);
        }
})