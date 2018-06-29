$("#bsignin").click(function (e) {
    e.preventDefault();
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

                if(res.title=="success")
                  setTimeout(function(){window.location = './';},2000);
            }
    })
});