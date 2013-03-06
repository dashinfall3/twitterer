$(document).ready(function(){
  $('#tweet-form').submit(function(event){
    event.preventDefault();
    var username = $(this).find('input[name="username"]').val();
    var content = $(this).find('input[name="content"]');
    var serializedContent = content.serialize();
    $('#tweet-form').attr('disabled', 'disabled')

    $.post('/'+ username +'/post', serializedContent, function(data) {

      $('#errors').html(data['message']);
      // if (data['success'] == true) {
        $('#tweet-list').prepend("<li>" + data['content'] + "</li><p style='margin:0px 0 0 15px; font-size: 13px;'>by " + data['username'] + "</p>");
      // });
    });
  });
});
