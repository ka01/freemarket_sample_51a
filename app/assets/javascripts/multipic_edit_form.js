$(function(){
  function appendDropBox(image_count){
    var dropboxHtml = '';
    dropboxHtml = `<li class="re__sell-upload-drop-box drophere">
                        <input class="re__sell-upload-drop-box__file" id="re__sell-upload-drop-box__file" name="item[item_images_attributes][${image_count+1}][image_url]" type="file">
                        <label class="re__sell-upload-drop-box__text" for="re__sell-upload-drop-box__file">
                          <p >ドラッグアンドドラッグドロップ<br>またはクリックしてファイルをアップロード</p>
                        </label>
                    </li>`;
    $('.drophere').remove()
    $('.re__sell-upload-items').append(dropboxHtml);
    $('.drophere').css({
          'width': `calc(620px - (125px * ${(image_count+1) % 5 }))`
        })
  }
  function appendPreview(img,image_count,file){
    var previewHtml ='';
    previewHtml =`<li class="re__sell-upload-item">
                  <img src="${img}" width="114" height="116">
                  <div class="re__btn_wrapper">
                    <label class="btn re__edit" for="re__sell-upload-drop-box__file">編集
                      <input id="re__sell-upload-drop-box__file" class="re__sell-upload-drop-box__file" type="file" data-image="${image_count+1}" name="item[item_images_attributes][${image_count+1}][image_url]" >
                    <input  type="hidden" name="item[item_images_attributes][${image_count+1}][id]" id="item_item_images_attributes_${image_count+1}_id">
                    </label><div class="btn re__delete">削除</div>
                  </div>
                  </li>
                  <input name="item[item_images_attributes][${image_count+1}][image_url]" id="re__sell-upload-drop-box__file" class="re__sell-upload-drop-box__file" type="file" data-image="2">`

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
  $(document).on('change', 'input[type= "file"].re__sell-upload-drop-box__file',function(e) {

    var file = $(this).prop('files')[0];
    var blobUrl = window.URL.createObjectURL(file);
    var test =`<img src="${blobUrl}" width="114" height="116">`
    $('.re__sell-upload-drop-box').append(test)

    $.when(
    renumbering()
    ).done(function(){
    image_count=$('.re__sell-upload-drop-box__file').length - 1
    })

    // appendPreview(blobUrl,image_count)
    // image_count = $('.re__sell-upload-drop-box__file').length - 1
    // appendDropBox(image_count)
  })

  $(document).on('click', '.re__delete', function() {
    var target_image = $(this).parent().parent();
    target_image.remove();
    $.when(
    renumbering()
    ).done(function(){
    image_count=$('.re__sell-upload-drop-box__file').length-2
    appendDropBox(image_count)
    })


  })

  })