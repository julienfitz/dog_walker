$(function() {
  $('input#inputPhone').keyup(function(){ validate(); 
  });

  $('.phone_us').mask('000-000-0000');
    
  function validate(){
     if (!($('input#inputPhone').val().match(/^[(]{0,1}[0-9]{3}[)]{0,1}[-\s\.]{0,1}[0-9]{3}[-\s\.]{0,1}[0-9]{4}$/))) {
        $('button:submit').prop("disabled", true);
        $('#phone_error').empty().append("Please enter a valid phone number");
     }
     else {
        $('#phone_error').empty();
        $('button:submit').prop("disabled", false);
     }
  }


});