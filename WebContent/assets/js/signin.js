$("#bsignin").click(function (e) {
    e.preventDefault();
    $.ajax({
        type:"POST",
        data: {
            email: document.getElementById("email").value,
            password:document.getElementById("password").value
        },
        url:"/check",
        success: function(res) {
            if(res.title=="success")
                window.location = '/';
            else {
                $(".modal-title").text(res.title);
                $(".modal-body").text(res.response);
                $("#myModal").modal('show');
            }
        }
    })
});