$("#save").click(function (e) {
    e.preventDefault();
    $.ajax({
        type:"POST",
        data: {
            oldpassword: document.getElementById("oldpassword").value,
            password:document.getElementById("password").value
        },
        url:"./ChangePass",
        success: function(res) {
                $(".modal-title").text(res.title);
                $(".modal-body").text(res.response);
                $("#myModal").modal('show');

                if(res.title=="success")
                  setTimeout(function(){window.location = './';},2000);
            }
    })
});