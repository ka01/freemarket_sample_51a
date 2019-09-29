$(function(){
  function appendDropBox(image_count){
    var dropboxHtml = '';
    dropboxHtml = `<li class="add__sell-upload-drop-box have-item-${(image_count+1) % 5}">
                        <input class="add__sell-upload-drop-box__file" data-image="${image_count + 1}" id="add__sell-upload-drop-box__file" name="item[item_images_attributes][${image_count+1}][image_url]" type="file">
                        <label class="add__sell-upload-drop-box__text" for="add__sell-upload-drop-box__file">
                          <p >ドラッグアンドドラッグドロップ<br>またはクリックしてファイルをアップロード</p>
                        </label>
                    </li>`;
    $('.add__sell-upload-drop-box').remove()
    $('.re__sell-upload-items').append(dropboxHtml);
    $('.add__sell-upload-drop-box').css({
          'width': `calc(100% - (137px * ${(image_count+1) % 5 }))`
        })
  }

  $(window).bind("load", function(){
    if(document.URL.match(/\/items\/\d+\/edit/)) {
        console.log('ok');
        var image_count = $('.re__sell-upload-drop-box__file').last().data('image')
        console.log(image_count);
        appendDropBox(image_count)
    }
  });
  $(document).on('click', '.re__delete', function() {
    var target_image = $(this).parent().parent();
    var image_count = $('.re__sell-upload-drop-box__file').last().data('image')
    target_image.remove();
    appendDropBox(image_count-1)
  })

  })