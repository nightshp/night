
function showRegisterForm(){
    $('.loginBox').fadeOut('fast',function(){
        $('.registerBox').fadeIn('fast');
        $('.login-footer').fadeOut('fast',function(){
            $('.register-footer').fadeIn('fast');
        });
        $('.modal-title').html('注册');
    }); 
    $('.error').removeClass('alert alert-danger').html('');
    $(".loginBox").css("display","none");
    $(".login-footer").css("display","none");
       
}
function showLoginForm(){
    $('#loginModal .registerBox').fadeOut('fast',function(){
        $('.loginBox').fadeIn('fast');
        $('.register-footer').fadeOut('fast',function(){
            $('.login-footer').fadeIn('fast');    
        });
        
        $('.modal-title').html('登录');
    });       
     $('.error').removeClass('alert alert-danger').html('');
     $(".registerBox").css("display","none");
    $(".register-footer").css("display","none");
}

function openLoginModal(){
    showLoginForm();
    setTimeout(function(){
        $('#loginModal').modal('show');
    }, 230);

}

function openRegisterModal(){
    showRegisterForm();
    setTimeout(function(){
        $('#loginModal').modal('show');
    }, 230);
    
}

// function loginAjax(){
    /*   Remove this comments when moving to server
    $.post( "/login", function( data ) {
            if(data == 1){
                window.location.replace("/home");            
            } else {
                 shakeModal(); 
            }
        });
    */

/*   Simulate error message from the server   */
     // shakeModal();
// }

// function shakeModal(){
//     $('#loginModal .modal-dialog').addClass('shake');
//              $('.error').addClass('alert alert-danger').html("Invalid email/password combination");
//              $('input[type="password"]').val('');
//              setTimeout( function(){
//                 $('#loginModal .modal-dialog').removeClass('shake');
//     }, 1000 );
// }
 function checkPwd() {
     var pwd1=document.getElementById("password").value;
     var pwd2=document.getElementById("password1").value;
     var promat=document.getElementById("promat");
     if(pwd1!=pwd2){
         promat.innerHTML="两次密码不一致";
         return false;
     }else{
         promat.innerHTML="";
         return true;
     }
 }
function checkPwd1(){
    var pwd=document.getElementById("password").value;
    var promat1=document.getElementById("promat1");
    if(pwd.length<6){
        promat1.innerHTML="密码不能少于6位";
        return flase;
    }else{
        promat1.innerHTML="";
        return true;
    }
}