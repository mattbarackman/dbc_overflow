$(document).ready(function(){
  $('.answer_button').on('ajax:success', function(event, data, status, xhr){
    $('.answer_button').hide();
    $('#answer_form').html(data.answer_template);
  });

  $('#answer_form').on('ajax:success', function(event, data, status, xhr){
    $('.answer_button').show();
    $('#answer_list').prepend(data.answer_template);
    $('#answer_form').empty();
  });

});
