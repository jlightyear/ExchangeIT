var myReady = function(){
var showContactUser = function(){
  $("#iwant").on("click", function(evt){
    evt.preventDefault();
    console.log('button iwant clicked');
    if($("#contact").css("display")=="none"){
      $("#contact").show(500);
    }
    else{
      $("#contact").hide("slow");
    }
  });
}();

var showComment = function(){
  $("#addcomment").on("click", function(evt){
    evt.preventDefault();
    console.log('button addcomment clicked');
    if($("#comment").css("display")=="none"){
      $("#comment").show(500);
    }
    else{
      $("#comment").hide("slow");
    }
  });
}();
}
$(document).ready(myReady);
$(document).on("page:load",myReady);