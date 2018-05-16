//variable
var firstname = document.getElementById('firstname');
var surname = document.getElementById('surname');
var email = document.getElementById('email');
var pass = document.getElementById('password');
var passr = document.getElementById('passwordr');
var signup = document.getElementById('sign_btn');
var greenBorder="2px solid rgba(50,205,50,0.5)";
var redBorder="2px solid red";
var wrongPassCheck=false;


//Reset validity on focus
for (i of [firstname, surname, email, pass, passr])
    i.addEventListener('focus',resetBorder);

//validation name
firstname.addEventListener('blur',function () {
    if(firstname.value.length>0)
        this.style.border=greenBorder;
    else
        this.style.border=redBorder;
});


//validation surname
surname.addEventListener('blur',function () {
    if(surname.value.length>0)
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

pass.addEventListener('keyup',function () {
    var wrong= new Array();
    var correct= new Array();
    var sum= checkPassword();

    if(sum%2==1) {
        correct.push("longC");
    }else{
        wrong.push("longC");
    }
    if(sum%4>=2){
        correct.push("lowerC");
    }else{
        wrong.push("lowerC");
    }
    if(sum%8>=4){
        correct.push("upperC");
    }else{
        wrong.push("upperC")
    }
    if(sum%16>=8){
        correct.push("passN");
    }else{
        wrong.push("passN");
    }
    for(var i of correct) {
        document.getElementById(i).classList.remove('fa-times');
        document.getElementById(i).classList.add('fa-check');
        document.getElementById(i).style.color = "green";
    }
    for(var i of wrong) {
        document.getElementById(i).classList.remove('fa-check');
        document.getElementById(i).classList.add('fa-times');
        document.getElementById(i).style.color = "red";
    }

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

//WIP: Animation
//$("#signupform").submit(function(e){
//    e.preventDefault();
//    $(".col-lg-12").animate({right: '100px'},200);
//    $(".col-lg-12").animate({left: '100px'},200);
//    $(".col-lg-12").animate({right: '250px'},200);
//    $(".col-lg-12").animate({left: '250px'},200,function(){
//        $("#signupform").unbind("submit").submit();
//    });
//});
