'use strict';
function isNumber (n) {
  return !isNaN(parseFloat(n)) && isFinite(n);
}

function checkIntRange(n) {
  console.log(n);
  return isNumber(n) && n>=0 && n<100 && n%1===0;
}

function validateForm() {
   var result = true;
   //check name
   var nameIn = $('input[name=name]').val();
   if(nameIn)
   {
      if(nameIn == "mary")
      {
           console.log("name is mary...");
           $('#name').css('background-color', 'red');
           $('#name').attr("placeholder","User name is already used by others").val("").focus().blur();
           result = false;
      }
      else
      {
          if(/\S/.test(nameIn))
          {
             //contain at least one character
             console.log("at least one character");
             $('#name').css('background-color','');
          }
          else
          {
            //contain only whitespace
            console.log("Name cannot have no character");
            $('#name').css('background-color', 'red');
            $('#name').attr("placeholder", "Name cannot have no character").val("").focus().blur();
            result = false;
          }
          
      }          
      
   }
   else
   {
      $('#name').css('background-color', 'red');
      $('#name').attr("placeholder", "Name cannot be empty").val("").focus().blur();
      result = false;

   }
    
    // check password
    var pw = $('input[name=pw]').val();
    if(pw)
    {
       if(checkIntRange(pw))
       {
          console.log("here");
          $('#pw').css('background-color', '');

       } else {
       
         console.log("pw invalid");
         $('#pw').css('background-color', 'red');
         $('#pw').attr("placeholder", "password must be 0-10").val("").focus().blur();
         result = false;
       }

    }
    else
    {
         $('#pw').css('background-color', 'red');
         $('#pw').attr("placeholder", "password cannot be empty").val("").focus().blur();
         result = false;
    }
    
    // check email
    var emailIn = $('input[name=email]').val();
    console.log(emailIn);
    if(emailIn)
    {
      var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
      if(re.test(emailIn))
      {
         //valid email address
         console.log("valid email address");
         $('#email').css('background-color','');
      }
      else
      {
        //invalid email address
        console.log("Email address is invalid");
        $('#email').css('background-color', 'red');
        $('#email').attr("placeholder", "Email address is invalid").val("").focus().blur();
        result = false;
      }       
      
    }
    else
    {
      $('#email').css('background-color', 'red');
      $('#email').attr("placeholder", "Email cannot be empty").val("").focus().blur();
      result = false;

    }
    
    if(result)
    {
        alert("Registered! Please Login");
        window.location.replace("/authentication/password");
    }
    
    return result;
}

$(document).ready(function () {




});
