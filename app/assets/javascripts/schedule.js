$(function(){
  $("#delete-appt").click(function(){
    var div_id = "#"+$(this).parents().data("id")
    console.log(div_id);
    $(div_id).remove();
  });
});