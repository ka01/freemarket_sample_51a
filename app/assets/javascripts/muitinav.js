$(document).ready(function(){
  $('.nav-category').hover(function(){
    $(this).addClass('active');
    $('.active').children('.category-1').show();
  },function(){
    $(this).removeClass('active');
    $(this).children('.category-1').hide();
  });

  $('.category-1__item').hover(function(){
    $(this).addClass('active2');
    var grandChild = $('.active2').children('.grand-child-wrap');
    grandChild.show();
  },function(){
    $(this).removeClass('active2');
    $(this).children('.grand-child-wrap').hide();

  });
});