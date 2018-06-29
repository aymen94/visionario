//variable
var firstname = document.getElementById('firstname');
var surname = document.getElementById('surname');
var email = document.getElementById('email');
var pass = document.getElementById('password');
var passr = document.getElementById('passwordr');
var birthday = document.getElementById('birthday');
var gender = document.getElementsByName('gender');
var greenBorder="2px solid rgba(50,205,50,0.5)";
var redBorder="2px solid red";
var wrongPassCheck=false;

if(birthday.value.length>0)
{
    birthday.type="date";
}

//Reset validity on focus
[firstname, surname, email, pass, passr, birthday].forEach(function (e) {
    e.addEventListener('focus',resetBorder);
});

//validation name
firstname.addEventListener('blur',function () {
    if(this.value.length>0)
        this.style.border = greenBorder;
    else
        this.style.border = redBorder;
});


//validation surname
surname.addEventListener('blur',function () {
    if(this.value.length>0)
        this.style.border=greenBorder;
    else
        this.style.border=redBorder;
});

//validation email
email.addEventListener('blur',function () {
    if(this.value.match(/\S+@\S+\.\S+/))
        this.style.border=greenBorder;
    else
        this.style.border=redBorder;
});

//validation password
pass.addEventListener('blur',function () {
    if(checkPassword()==15)
        this.style.border=greenBorder;
    else
        this.style.border=redBorder;
    //Adjust also passr Border
    passrBorder();
});

//validation date
birthday.addEventListener('blur',function () {
    let my = new Date(this.value).setFullYear(new Date(this.value).getFullYear()+18);
    if(Date.now() >=  my)
        this.style.border = greenBorder;
    else
        this.style.border = redBorder;
})

birthday.addEventListener('focus',function () {  
    this.type="date";
})

pass.addEventListener('keyup',function () {
    var sum= checkPassword();

    if(sum%2==1)
        correct("longC");
    else
        wrong("longC");

    if(sum%4>=2)
        correct("lowerC");
    else
        wrong("lowerC");

    if(sum%8>=4)
        correct("upperC");
    else
        wrong("upperC")

    if(sum%16>=8)
        correct("passN");
    else
        wrong("passN");


    if(!wrongPassCheck) {
        document.getElementById("passInfo").hidden=0;
        wrongPassCheck=true;
    }

    // Update passr match flag and passr border
    passrMatch();
    passrBorder();
});

passr.addEventListener('keyup',passrMatch);

passr.addEventListener('blur', passrBorder);

function resetBorder() {
    this.style.border=""
}

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
    var sum=0;
    if(pass.value.length>=8)
        sum+=1;
    if(pass.value.match(/[a-z]/))
        sum+=2;
    if(pass.value.match(/[A-Z]/))
        sum+=4;
    if(pass.value.match(/[0-9]/))
        sum+=8;
    return sum;
}

function passrMatch() {
    // When this function is called by an event of passr
    // do not check for passr.value.length
    if(this==passr || passr.value.length>0) {
        if(passr.value==pass.value) {
            document.getElementById("passCheck").hidden=1;
            document.getElementById("passCheck2").hidden=0;
        }
        else {
            document.getElementById("passCheck").hidden=0;
            document.getElementById("passCheck2").hidden=1;
        }
    }
}

function passrBorder() {
    // When this function is called by an event of passr
    // do not check for passr.value.length
    if(this==passr || passr.value.length>0) {
        if(passr.value==pass.value && checkPassword()==15)
            passr.style.border=greenBorder;
        else
            passr.style.border=redBorder;
    }
}
 function genderChecked(){
     for(let i=0;i<gender.length;i++ )
         if(gender[i].checked)
             return gender[i].value;
 }


$("#signupform").submit(function(e){
    e.preventDefault();
    if(firstname.value.length>0 && surname.value.length>0
        && email.value.match(/\S+@\S+\.\S+/) &&
        checkPassword()==15 && passr.value==pass.value &&
        (Date.now() >= new Date(birthday.value).setFullYear(new Date(birthday.value).getFullYear()+18)) &&
        genderChecked())

        $.ajax({
            type: "POST",
            data: {
                name: firstname.value,
                surname: surname.value,
                email: email.value,
                password: pass.value,
                birthday: birthday.value,
                gender: genderChecked()
            },
            url: "./registration",
            success: function(res) {

                $(".modal-title").text(res.title);
                $(".modal-body").text(res.response);
                $("#myModal").modal('show');

                if(res.title=="success")
                  setTimeout(function(){window.location = './signin';},2000);
            }
        });
});