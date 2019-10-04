$(function(){
  var item_price_field = $('.sell-form-group__right');
  var item_price;
  var item_fee;
  var item_benefit;

  function separate(num) {
    return String(num).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
  }

  item_price_field.keyup('change', function () {
    if ($(this).children('input').length) {
      item_price = $(this).children('input').val();
    }
    item_fee = Math.floor(item_price / 10);
    item_benefit = separate(item_price - item_fee);
    item_price_field.children('p').text("¥" + item_fee);
    item_price_field.children('h3').text("¥" + item_benefit);
  })
});