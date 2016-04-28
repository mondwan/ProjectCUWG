'use strict';

$(document).ready(function () {
    var $form = $('#loginF');
    var $name = $('#name');
    var $pw = $('#pw');
    var $ans = $('#ans');
    var $alert = $('#alert');
    var $hashfuncbtn = $('#hashfuncbtn');
    var hashfunc = document.getElementById("hashfunc");
    var $Hash_result = $('#Hash_result');
    var $redfuncbtn1 = $('#redfuncbtn1');
    var redfunc1 = document.getElementById("redfunc1");
    var $redfunc1_result = $('#redfunc1_result');
    var $redfuncbtn2 = $('#redfuncbtn2');
    var redfunc2 = document.getElementById("redfunc2");
    var $redfunc2_result = $('#redfunc2_result');
    var $redfuncbtn3 = $('#redfuncbtn3');
    var redfunc3 = document.getElementById("redfunc3");
    var $redfunc3_result = $('#redfunc3_result');    
    

    $form.on('submit', function (e) {
        $alert.removeClass('hidden');
        $alert.removeClass('alert-danger');
        $alert.removeClass('alert-success');

        if (
            $name.val() !== 'mary' ||
            $ans.val() !== $pw.val()
        ) {
            e.stopPropagation();
            e.preventDefault();
            $alert.addClass('alert-danger');
            $alert.text('Password is not correct');
        } else {
            $alert.addClass('alert-success');
            $alert.text('Password is correct');
        }
    });
// RainbowTable hash function handling    
    $hashfuncbtn.click(function(){
    	if (hashfunc.value > 999999 || hashfunc.value<100000){
    		alert('For simplicity, the password will only be at the range 100000 to 999999 and integer only');
    	} else{
    		//Simple hash function
    		$('#Hash_result').val((hashfunc.value.charAt(0))+(hashfunc.value.charAt(0))+(hashfunc.value.charAt(2))+(hashfunc.value.charAt(1))+(hashfunc.value.charAt(1))+(hashfunc.value.charAt(1)));
    	}
    		});
    
    // RainbowTable Reduction function #1 handling    
    $redfuncbtn1.click(function(){
    	if (redfunc1.value > 999999 || redfunc1.value< 100000){
    		alert("invalid hash");
    	} else{
    		//Simple hash function
    		$('#redfunc1_result').val((hashfunc.value.charAt(0))+((hashfunc.value.charAt(0)+12)%9)+(hashfunc.value.charAt(2))+(hashfunc.value.charAt(1))+(hashfunc.value.charAt(1))+(hashfunc.value.charAt(1)).toString());
    	}
    		});
    
    // RainbowTable Reduction function #2 handling    
    $redfuncbtn2.click(function(){
    	if (redfunc2.value > 999999 || redfunc2.value< 100000){
    		alert("invalid hash");
    	} else{
    		//Simple hash function
    		$('#redfunc2_result').val((hashfunc.value.charAt(0))+((hashfunc.value.charAt(0)+12)%9)+(hashfunc.value.charAt(2))+(hashfunc.value.charAt(1))+(hashfunc.value.charAt(1))+(hashfunc.value.charAt(1)).toString());
    	}
    		}); 
    
    // RainbowTable Reduction function #3 handling    
    $redfuncbtn3.click(function(){
    	if (redfunc3.value > 999999 || redfunc3.value< 100000){
    		alert("invalid hash");
    	} else{
    		//Simple hash function
    		$('#redfunc3_result').val((hashfunc.value.charAt(0))+((hashfunc.value.charAt(0)+12)%9)+(hashfunc.value.charAt(2))+(hashfunc.value.charAt(1))+(hashfunc.value.charAt(1))+(hashfunc.value.charAt(1)).toString());
    	}
    		});   
    
});

