/*
 * Copyright (c) 2018. Visionario
 */
function checked()
{
    return $("input[name='variant']:checked").val();
}

function hide()
{
    $(".price").each(function() 
            {
                $(this).addClass("d-none");
            });
}

$(document).ready(function($) {
    var x="#price"
    $("input[name='variant']:checked").parent().button('toggle')
    hide()
    if(checked()==null)
    {
        $("#addCart").prop('disabled', true)
        $("#addWish").prop('disabled', true)
    }
    else
    {
        $("#addCart").prop('disabled', false)
        $("#addWish").prop('disabled', false)
        x+=checked();
    }
    $(x).removeClass("d-none");


});

$(".btn-secondary").click(function(e){
    hide();
    var x="#price"+$(this).children().val();
    $(x).removeClass("d-none");
    $("#addCart").prop('disabled', false)
    $("#addWish").prop('disabled', false)
})

$("#addCart").click(function (e) {
    e.preventDefault();
    $.ajax({
        type:"POST",
        data: {
            "prod": document.getElementById("prodId").value,
            "var": $("input[name='variant']:checked").val(),
            "add": document.getElementById("quantity").value
},
        url:"./addcart",
        success: function(res){
        location.href = "./cart"
        }
    })
});