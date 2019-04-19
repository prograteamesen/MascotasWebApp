
window.addEventListener('load', function(){
   document.getElementById("mysubmit").addEventListener('click', function(){
      var user = document.getElementById("user").value;
      var password = document.getElementById("password").value;
      
      var bandera = false;
      
      if (user.length > 0 && password.length > 0) {
          bandera = true;
      }
      
      if(bandera) {
          document.getElementById("myform").submit();
      }else{
          alert('Por favor, llenar todos los campos.');
      }    
   });
    
});

var myInput = document.getElementById("password");
var letter = document.getElementById("letter");
var capital = document.getElementById("capital");
var number = document.getElementById("number");
var length = document.getElementById("length");

// When the user clicks on the password field, show the message box
myInput.onfocus = function() {
  document.getElementById("message").style.display = "block";
}

// When the user clicks outside of the password field, hide the message box
myInput.onblur = function() {
  document.getElementById("message").style.display = "none";
}

// When the user starts to type something inside the password field
myInput.onkeyup = function() {
  // Validate lowercase letters
  var lowerCaseLetters = /[a-z]/g;
  if(myInput.value.match(lowerCaseLetters)) {  
    letter.classList.remove("invalid");
    letter.classList.add("valid");
  } else {
    letter.classList.remove("valid");
    letter.classList.add("invalid");
  }
  
  // Validate capital letters
  var upperCaseLetters = /[A-Z]/g;
  if(myInput.value.match(upperCaseLetters)) {  
    capital.classList.remove("invalid");
    capital.classList.add("valid");
  } else {
    capital.classList.remove("valid");
    capital.classList.add("invalid");
  }

  // Validate numbers
  var numbers = /[0-9]/g;
  if(myInput.value.match(numbers)) {  
    number.classList.remove("invalid");
    number.classList.add("valid");
  } else {
    number.classList.remove("valid");
    number.classList.add("invalid");
  }
  
  // Validate length
  if(myInput.value.length >= 8) {
    length.classList.remove("invalid");
    length.classList.add("valid");
  } else {
    length.classList.remove("valid");
    length.classList.add("invalid");
  }
}


    $('#meal').blur(function(){
        var option = $(this).val();
        var price = 0.0;
        if(option === 'pasta')
        {
            price= 7.5;
        }
        else if(option==='chicken')
        {
            price= 8.5;
        }
        else (option==='fish')
        {
            price= 10.5;
        }
        
        $('#price').html("<label>"+price+"</label>");
        $('#priceval').val(price);
        
    });