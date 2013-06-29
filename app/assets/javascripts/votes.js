$(document).ready(function(){

 $('.vote').on('ajax:success', function(e, data, status){
    $(this).siblings('.votecount').text(data);
    });

  $('#answer_list').on('ajax:success', '.answer_vote', function(e, data, status){
    $(this).siblings('.votecount').text(data);
    });

  $('.winner').on('ajax:success', function(e, data, status){
    if (data == true){
    $('.winner > i').removeClass().addClass('icon-star-empty icon-3x')
    $(this).find('i').removeClass('icon-star-empty');
    $(this).find('i').addClass('icon-star');
    }
  });
  
});
