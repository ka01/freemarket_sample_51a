$(document).ready(function(){
  $('.category-title').hover(function(){
    $(this).addClass('hover-title');
    $('.hover-title').children('.category-1').show();
  },function(){
    $(this).removeClass('hover-title');
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

  $('.brand-title').hover(function(){
    $(this).addClass('hover-title');
    $('.hover-title').children('.brand-1').show();
  },function(){
    $(this).removeClass('hover-title');
    $(this).children('.brand-1').hide();
  });
});
