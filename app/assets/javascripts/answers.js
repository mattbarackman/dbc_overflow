$(document).ready(function(){
  $('.answer_button').on('ajax:success', function(event, data, status, xhr){
    debugger;
    $('#answer_form').html(data.answer_template);

  });

  $('#answer_form').on('ajax:success', function(event, data, status, xhr){
    $('#answer_list').append(data.answer_template);
    $('#answer_form').empty();
  });

});
