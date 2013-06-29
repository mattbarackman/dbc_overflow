$(document).ready(function(){

 $('.vote').on('ajax:success', function(e, data, status){
     console.log("hello");
     console.log(data);
    $(this).siblings('.votecount').text(data)
    });

  $('.vote').on('ajax:error', function(e, data, status){
   console.log('WE FAILED');
  });

  $('.winner').on('ajax:success', function(e, data, status){
    $('.winner > i').removeClass().addClass('icon-star-empty icon-3x')
    console.log(this);
    $(this).find('i').removeClass('icon-star-empty');
    $(this).find('i').addClass('icon-star');
  });
  
});
