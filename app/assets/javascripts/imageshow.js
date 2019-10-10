$(function(){
  $(window).bind("load", function(){
    if(document.URL.match(/\/items\/\d+/)) {
      $(".owl-item").first().addClass("active")
    }
  });
  $(document).on('mouseenter','.owl-dot',function() {
    var index = $('.owl-dot').index(this);
    console.log(index)
    $('.owl-item.active').removeClass('active')
    $('.owl-item').eq(index).addClass('active')
    $(this).css({'opacity': '1'})
  })
  $(document).on('mouseleave','.owl-dot',function() {
    $(this).css({'opacity': '0.5'})
  })
})