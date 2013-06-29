$(document).ready(function(){
  $('.answer').on('ajax:success', function(event, data, status, xhr){
    $('#answer_form').html(data.answer_template);
  });

  $('#answer_form').on('ajax:success', function(event, data, status, xhr){
    $('#answer_list').append(data.answer_template);
    $('#answer_form').empty();
  });

});
