/*
 * Copyright (c) 2018. Visionario
 */
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

        }
    })
});