$(document).ready(function(){
  $.ajax({
    type: "get",
    url: "/ChrisSell3/tweets",
    dataType:"html",
  }).done(function(data){
    $('.tweets-holder').hide()
    $('.container').append(data)
  });
});

