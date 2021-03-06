$("#bsignin").click(function (e) {

    e.preventDefault();
    var redirect="./";
    $.ajax({
        type:"POST",
        data: {
            email: document.getElementById("email").value.toLowerCase(),
            password:document.getElementById("password").value
        },
        url:"./login",
        success: function(res) {
                $(".modal-title").text(res.title);
                $(".modal-body").text(res.response);
                $("#myModal").modal('show');

                var searchParams = new URLSearchParams(window.location.search);
                
                if(searchParams.has('redirect'))
                    redirect = redirect + searchParams.get('redirect') ;
                if(res.title=="success")
                  setTimeout(function(){window.location = redirect;},2000);
            }
    })
});

$("#forgot").click(function (e) {
    e.preventDefault();
    if(document.getElementById("email").value.match(/\S+@\S+\.\S+/))
    {
        $(".modal-title").text("Information");
        $(".modal-body").text("We sent you an email with instructions for password recovery");
        $("#myModal").modal('show');
        setTimeout(function(){$("#myModal").modal('hide');},2000);
    }
    else {
        $(".modal-title").text("Error");
        $(".modal-body").text("Your mail address is not correct");
        $("#myModal").modal('show');
        setTimeout(function(){$("#myModal").modal('hide');},2000);
    }
});
