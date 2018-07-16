$(".remove").each(function() {    
    $(this).click(function(e) {
        e.preventDefault();
        var index=this.id.charAt(6);
        $.ajax({
            type:"POST",
            data: {
                prod: $("#prod"+index).val(),
                var: $("#var"+index).val(),
                quantity: 0
            },
            url:"./addcart",
            success: function() {
                $("#"+index).remove();
                if($(".row-body").get(0) === undefined)
                {
                    $("#cart").addClass("d-none");
                    $("#empty").removeClass("d-none");
                }
                else
                    updateTotal();
            }
        })
    })
});


$(".quantity").each(function() {    
    $(this).change( function(e) {
        e.preventDefault();
        val=$(this).val();
        if(val>0 && val<=parseInt($(this).attr("max")))
        {
            var index=this.id.charAt(13);
            $.ajax({
                type:"POST",
                data: {
                    prod: $("#prod"+index).val(),
                    var: $("#var"+index).val(),
                    quantity: val
                },
                url:"./addcart",
                success: function() {
                    updateTotal();
                }
            })
        }
    })

});

function updateTotal()
{
    var total=0;
    $(".row-body").each(function() {
        var index=this.id;
        total+=$("#inputQuantity"+index).val()*$("#price"+index).val();
        $("#subtotal").text(total.toFixed(2));
    })
}