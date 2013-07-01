$(document).ready(function(){
  $('.comment_button').on('ajax:success', function(event, data, status, xhr){
    $('.comment_button').hide();
    $('#comment_form').html(data.comment_template);
  });

  $('#comment_form').on('ajax:success', function(event, data, status, xhr){
    $('.comment_button').show();
    $('.question_comments').prepend(data.comment_template);
    $('#comment_form').empty();
  });

});
