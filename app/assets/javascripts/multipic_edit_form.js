$(function(){
  function appendDropBox(image_count){
    var dropboxHtml = '';
    dropboxHtml = `<li class="add__sell-upload-drop-box have-item-${(image_count+1) % 5}">
                        <input class="add__sell-upload-drop-box__file" id="add__sell-upload-drop-box__file" name="item[item_images_attributes][${image_count+1}][image_url]" type="file">
                        <label class="add__sell-upload-drop-box__text" for="add__sell-upload-drop-box__file">
                          <p >ドラッグアンドドラッグドロップ<br>またはクリックしてファイルをアップロード</p>
                        </label>
                    </li>`;
    $('.add__sell-upload-drop-box').remove()
    $('.re__sell-upload-items').append(dropboxHtml);
    $('.add__sell-upload-drop-box').css({
          'width': `calc(620px - (130px * ${(image_count+1) % 5 }))`
        })
  }
  function renumbering(){
    var i = 0;
    $('.re__sell-upload-drop-box__file').each(function(i,elem){
      $(elem).attr('data-image',i);
      i++;
    })
  }

  $(window).bind("load", function(){
    if(document.URL.match(/\/items\/\d+\/edit/)) {
        var image_count = $('.re__sell-upload-drop-box__file').last().data('image')
        appendDropBox(image_count)
    }
  });
  $(document).on('click', '.re__delete', function() {
    var target_image = $(this).parent().parent();
    target_image.remove();
    $.when(
    renumbering()
    ).done(function(){
    image_count=$('.re__sell-upload-drop-box__file').length - 1
    appendDropBox(image_count)
    })


  })

  })