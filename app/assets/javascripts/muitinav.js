$(document).ready(function(){
  $('.nav-category').hover(function(){
    $(this).addClass('hover-category-title');
    $('.hover-category-title').children('.category-1').show();
  },function(){
    $(this).removeClass('hover-category-title');
    $(this).children('.category-1').hide();
  });

  $('.category-1__item').hover(function(){
    $(this).addClass('hover-category-1');
    $('.hover-category-1').children('.category-2').show();
  },function(){
    $(this).removeClass('hover-category-1');
    $(this).children('.category-2').hide();
  });

  $('.category-2__item').hover(function(){
    $(this).addClass('hover-category-2');
    $('.hover-category-2').children('.category-3').show();
  },function(){
    $(this).removeClass('hover-category-2');
    $(this).children('.category-3').hide();
  });
});
