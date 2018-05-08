//variable
var firstname = document.getElementById('firstname');
var surname = document.getElementById('surname');
var email = document.getElementById('email');
var pass = document.getElementById('password');
var passr = document.getElementById('passwordr');

//validation name
firstname.addEventListener('blur',function () {
    if(firstname.value.length>0)
        firstname.style.border="2px solid rgb(50,205,50,0.5)";
    else
        firstname.style.border="2px solid red";
});

//validation surname
surname.addEventListener('blur',function () {
    if(surname.value.length>0)
        surname.style.border="2px solid rgb(50,205,50,0.5)";
    else
        surname.style.border="2px solid red";
});

//validation email
email.addEventListener('blur',function () {
    if(email.value.match(/\S+@\S+\.\S+/))
        email.style.border="2px solid rgb(50,205,50,0.5)";
    else
        email.style.border="2px solid red";
});

//validation password
pass.addEventListener('keypress',function () {
        if(pass.value.length>=8) {
            document.getElementById('longC').classList.remove('fa-times');
            document.getElementById('longC').classList.add('fa-check');
            document.getElementById('longC').style.color = "green";
        }else{
            document.getElementById('longC').classList.remove('fa-check');
            document.getElementById('longC').classList.add('fa-times');
            document.getElementById('longC').style.color = "red";
        }
        if(pass.value.match(/[a-z]/)){
            document.getElementById('lowerC').classList.remove('fa-times');
            document.getElementById('lowerC').classList.add('fa-check');
            document.getElementById('lowerC').style.color = "green";
        }else{
            document.getElementById('lowerC').classList.remove('fa-check');
            document.getElementById('lowerC').classList.add('fa-times');
            document.getElementById('lowerC').style.color = "red";
        }
        if(pass.value.match(/[A-Z]/)){
             document.getElementById('upperC').classList.remove('fa-times');
             document.getElementById('upperC').classList.add('fa-check');
             document.getElementById('upperC').style.color = "green";
         }else{
             document.getElementById('upperC').classList.remove('fa-check');
             document.getElementById('upperC').classList.add('fa-times');
             document.getElementById('upperC').style.color = "red";
         }
         if(pass.value.match(/[0-9]/)){
             document.getElementById('passN').classList.remove('fa-times');
             document.getElementById('passN').classList.add('fa-check');
             document.getElementById('passN').style.color = "green";
         }else{
             document.getElementById('passN').classList.remove('fa-check');
             document.getElementById('passN').classList.add('fa-times');
             document.getElementById('passN').style.color = "red";
    }
});

passr.addEventListener('change',function () {
       if(passr.value==pass.value) {
            document.getElementById('passM').classList.remove('fa-times');
            document.getElementById('passM').classList.add('fa-check');
            document.getElementById('passM').style.color = "green";
       }else {
           document.getElementById('passM').classList.remove('fa-check');
           document.getElementById('passM').classList.add('fa-times');
           document.getElementById('passM').style.color = "red";
       }
})
