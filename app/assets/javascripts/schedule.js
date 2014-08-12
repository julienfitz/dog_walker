$(function(){
  $("#delete-appt").click(function(){
    var div_id = "#"+$(this).parents().data("id")
    console.log(div_id);
    $("#create-appt").html("");
    $(div_id).remove();
  });

});


