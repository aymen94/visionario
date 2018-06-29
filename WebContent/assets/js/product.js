/*
 * Copyright (c) 2018. Visionario
 */
$("#addCart").click(function (e) {
    e.preventDefault();
    $.ajax({
        type:"POST",
        data: {
            "prod": document.getElementById("prodId").value,
            "var":document.getElementById("password").value
        },
        url:"./addcart",
        success: function(res,text,xhr) {
            if(xhr.status==200)
                $(".modal-title").text(res.title);
                $(".modal-body").text(res.response);
                $("#myModal").modal('Product has been added to your cart');

        }
    })
});