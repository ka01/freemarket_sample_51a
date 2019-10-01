$(function(){
  function appendDropBox(image_count){
    var dropboxHtml = '';
    dropboxHtml = `<li class="re__sell-upload-drop-box drophere">
                    <input id="re__sell-upload-drop-box__file_${image_count}" class="re__sell-upload-drop-box__file" data-image="${image_count}" name="item[item_images_attributes][${image_count}][image_url]" type="file">
                    <label class="re__sell-upload-drop-box__text" for="re__sell-upload-drop-box__file">
                      <p >ドラッグアンドドラッグドロップ<br>またはクリックしてファイルをアップロード</p>
                    </label>
                  </li>`;
    $('.drophere').remove()
    $('.re__sell-upload-items').append(dropboxHtml);
    $('.drophere').css({
          'width': `calc(620px - (125px * ${(image_count) % 5 }))`
        })
  }
  function appendPreview(img,image_count,file){
    var previewHtml ='';
    previewHtml =`<li class="re__sell-upload-item">
                  <img src="/uploads/item_image/image_url/859/sample.jpg" width="114" height="116">
                  <div class="re__btn_wrapper">
                  <label class="btn re__edit" for="re__sell-upload-drop-box__file_4">編集
                  <input id="re__sell-upload-drop-box__file_4" class="re__sell-upload-drop-box__file" type="file" data-image="4" name="item[item_images_attributes][4][image_url]">
                  <input value="859" type="hidden" name="item[item_images_attributes][4][id]" id="item_item_images_attributes_4_id">
                  </label>
                  <div class="btn re__delete">削除</div>
                  </div>
                  <li class="re__sell-upload-item">
                  <img src="blob:http://localhost:3000/c6b338ea-8335-408e-b3bc-cc2208d5cfb1" width="114" height="116">
                    <div class="re__btn_wrapper">
                    <label class="btn re__edit" for="re__sell-upload-drop-box__file_5">編集
                    <input id="re__sell-upload-drop-box__file_5" class="re__sell-upload-drop-box__file" data-image="5" name="item[item_images_attributes][5][image_url]" type="file">
                    </label>
                    <div class="btn re__delete">削除</div>
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
        var image_count = $('.re__sell-upload-drop-box__file').length //既存5枚の場合,drophereはこの時点でないので"5"
        console.log(image_count)
        appendDropBox(image_count)
    }
  });
  $(document).on('change', 'input[type= "file"]',function(e) {
    var image_count = $('.re__sell-upload-drop-box__file').length  //既存5枚の場合,drophereも含めて"6"
    console.log(image_count)

    var file = $(this).prop('files')[0];
    var blobUrl = window.URL.createObjectURL(file);
    var preview =`<img src="${blobUrl}" width="114" height="116">`
    $('.re__sell-upload-drop-box__text').remove();

    $(this).wrap(`<div class="re__btn_wrapper"><label class="btn re__edit" for="re__sell-upload-drop-box__file_${image_count-1}">編集</label><div class="btn re__delete">削除</div></div>`)
    $('.re__sell-upload-drop-box').prepend(preview).removeAttr('style').removeClass("re__sell-upload-drop-box drophere").addClass("re__sell-upload-item")

    $.when(
    renumbering()
    ).done(function(){
    image_count=$('.re__sell-upload-drop-box__file').length - 1
    })
    image_count = $('.re__sell-upload-drop-box__file').length
    appendDropBox(image_count)
  })

  $(document).on('click', '.re__delete', function() {
    var target_image = $(this).parent().parent();
    target_image.remove();
    $.when(
    renumbering()
    ).done(function(){
    image_count=$('.re__sell-upload-drop-box__file').length
    appendDropBox(image_count - 1)
    })


  })

  })