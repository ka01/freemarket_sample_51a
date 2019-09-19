$(document).on('turbolinks:load', function(){
  var dropzone = $('.sell-upload-items-container');
  var dropzone2 = $('.sell-upload-items-container2');
  var dropzone_box = $('.dropzone-box');
  var images = [];
  var inputs = [];
  var input_area = $('.sell-upload-drop-box');
  var preview = $('#preview');
  var preview2 = $('#preview2');

  $(document).on('change', 'input[type= "file"].sell-upload-drop-box__file', function(event) {
    var file = $(this).prop('files')[0];
    console.log("( ´∀｀)");
    var reader = new FileReader();
    inputs.push($(this));
    var img = $(`<div class= "img_view"><img></div>`);
    render.onload = function(e) {
      var btn_wrapper = $('<div class="btn_wrapper"><div class="btn edit">編集</div><div class="btn delete">削除</div></div>');
      img.append(btn_wrapper);
      img.find('img').attr({
        scr: e.target.result
      })
    }
  })
})