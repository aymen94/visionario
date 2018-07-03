$("#save").click(function (e) {
        e.preventDefault();
        if(firstname.value.length>0 && surname.value.length>0
            && email.value.match(/\S+@\S+\.\S+/) &&
            (Date.now() >= new Date(birthday.value).setFullYear(new Date(birthday.value).getFullYear()+18)) &&
            genderChecked())

            $.ajax({
                type: "POST",
                data: {
                    name: firstname.value,
                    surname: surname.value,
                    email: email.value,
                    birthday: birthday.value,
                    gender: genderChecked(),
                    update: "true"
                },
                url: "./registration",
                success: function(res) {

                    $(".modal-title").text(res.title);
                    $(".modal-body").text(res.response);
                    $("#myModal").modal('show');

                    if(res.title=="success")
                      setTimeout(function(){window.location = './';},2000);
                }
            });
    });