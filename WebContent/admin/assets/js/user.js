/*
 * Copyright (c) 2018. Visionario
 */
var firstname = document.getElementById('firstname');
var surname = document.getElementById('surname');
var email = document.getElementById('email');
var pass = document.getElementById('password');
var birthday = document.getElementById('birthday');
var gender = document.getElementsByName('gender');
var permission = document.getElementById('permission');

$(".btn-danger").click(function (){
    var sel = $(this).parent().parent();
    $.ajax({
        type:"POST",
        data: {
            type:"usr",
            id: sel.children("th").text()
        },
        url:"./delete",
        success: function() {
            sel.addClass("table-danger");
        }
    })
});

function genderChecked(){
    for(let i=0;i<gender.length;i++ )
        if(gender[i].checked)
            return gender[i].value;
}

$("#adduserb").click(function(e){
    e.preventDefault();
        $.ajax({
            type: "POST",
            data: {
                name: firstname.value,
                surname: surname.value,
                email: email.value,
                password: pass.value,
                birthday: birthday.value,
                permission:permission.value,
                gender: genderChecked()
            },
            url: location.origin+"/registration",
            success: function() {
            location.reload();
        }});
});
