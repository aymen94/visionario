var pass = document.getElementById('password');
var passr = document.getElementById('passwordr');
var wrongPassCheck=false;

function correct(i) {
    document.getElementById(i).classList.remove('fa-times');
    document.getElementById(i).classList.add('fa-check');
    document.getElementById(i).style.color = "green";
}
function wrong(i) {
    document.getElementById(i).classList.remove('fa-check');
    document.getElementById(i).classList.add('fa-times');
    document.getElementById(i).style.color = "red";
}

function checkPassword() {
    // The result represent in binary the checks passed.
    // The less significant bit is length check, the second is lower case letter,
    // the third is upper case letter, the most significant is the number check
    var sum = 0;
    if (pass.value.length >= 8)
        sum += 1;
    if (pass.value.match(/[a-z]/))
        sum += 2;
    if (pass.value.match(/[A-Z]/))
        sum += 4;
    if (pass.value.match(/[0-9]/))
        sum += 8;
    return sum;
}

function passrMatch() {
    // When this function is called by an event of passr
    // do not check for passr.value.length
    if (this == passr || passr.value.length > 0) {
        if (passr.value == pass.value) {
            document.getElementById("passCheck").hidden = 1;
            document.getElementById("passCheck2").hidden = 0;
        } else {
            document.getElementById("passCheck").hidden = 0;
            document.getElementById("passCheck2").hidden = 1;
        }
    }
}
pass.addEventListener('keyup', function() {
    var sum = checkPassword();

    if (sum % 2 == 1)
        correct("longC");
    else
        wrong("longC");

    if (sum % 4 >= 2)
        correct("lowerC");
    else
        wrong("lowerC");

    if (sum % 8 >= 4)
        correct("upperC");
    else
        wrong("upperC")

    if (sum % 16 >= 8)
        correct("passN");
    else
        wrong("passN");

    if (!wrongPassCheck) {
        document.getElementById("passInfo").hidden = 0;
        wrongPassCheck = true;
    }

    // Update passr match flag and passr border
    passrMatch();
});

passr.addEventListener('keyup', passrMatch);

$("#save").click(function(e) {
    e.preventDefault();
    if(checkPassword()==15 && passr.value==pass.value)
    $.ajax({
        type : "POST",
        data : {
            oldpassword : document.getElementById("oldpassword").value,
            password : document.getElementById("password").value
        },
        url : "./ChangePass",
        success : function(res) {
            $(".modal-title").text(res.title);
            $(".modal-body").text(res.response);
            $("#myModal").modal('show');

            if (res.title == "success")
                setTimeout(function() {
                    window.location = './';
                }, 2000);
        }
    });
    else {
        $(".modal-title").text("Error");
        $(".modal-body").text("All fields must be filled in correctly");
        $("#myModal").modal('show');
        setTimeout(function(){$("#myModal").modal('hide');},2000);
    }
});