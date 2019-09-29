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
          'width': `calc(620px - (125px * ${(image_count+1) % 5 }))`
        })
  }
  function appendPreview(img){
    var previewHtml ='';
    previewHtml =`<li class="re__sell-upload-item">
                  <img src="${img}" width="114" height="116">
                  <div class="re__btn_wrapper">
                    <label class="btn re__edit" for="re__sell-upload-drop-box__file">編集
                      <input id="re__sell-upload-drop-box__file" class="re__sell-upload-drop-box__file" type="file" data-image="3" name="item[item_images_attributes][3][image_url]">
                    <input value="843" type="hidden" name="item[item_images_attributes][3][id]" id="item_item_images_attributes_3_id">
                    </label><div class="btn re__delete">削除</div>
                  </div>
                  </li>`
    $('.re__sell-upload-items').append(previewHtml);
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
  $(document).on('change', 'input[type= "file"].add__sell-upload-drop-box__file',function(e) {
    console.log('ok')
    var file = $(this).prop('files')[0];
    var blobUrl = window.URL.createObjectURL(file);
    appendPreview(blobUrl)
    image_count=$('.re__sell-upload-drop-box__file').length - 1
    appendDropBox(image_count)
  })

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