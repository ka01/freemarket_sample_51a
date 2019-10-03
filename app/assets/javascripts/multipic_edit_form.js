$(function(){
  var picture_num = ""
  var delete_items =[]

  function appendDropBox(image_count,picture_num){
    var dropboxHtml = '';
    dropboxHtml = `<li class="re__sell-upload-drop-box drophere">
                    <input id="re__sell-upload-drop-box__file_${image_count}" class="re__sell-upload-drop-box__file" data-image="${image_count}" name="item[item_images_attributes][${picture_num}]][image_url]" type="file">
                    <label class="re__sell-upload-drop-box__text" for="re__sell-upload-drop-box__file_${image_count}">
                      <p >ドラッグアンドドラッグドロップ<br>またはクリックしてファイルをアップロード</p>
                    </label>
                  </li>`;
    $('.drophere').remove()
    $('.re__sell-upload-items').append(dropboxHtml);
    $('.drophere').css({
          'width': `calc(620px - (125px * ${(image_count) % 5 }))`
        })
  }
  function renumbering(){
    var i = 0;
    $('.re__sell-upload-drop-box__file').each(function(i,elem){
      $(elem).attr('id',`re__sell-upload-drop-box__file_${i}`);
      $(elem).parent().attr('for',`re__sell-upload-drop-box__file_${i}`);
      $(elem).attr('data-image',i);
      i++;
    })
  }

  $(window).bind("load", function(){
    if(document.URL.match(/\/items\/\d+\/edit/)) {
        var image_count = $('.re__sell-upload-drop-box__file').last().data('image')  //既存5枚の場合,drophereはこの時点でないので"5" ※①
        picture_num = image_count                                                    //Editビュー初期表示ではpicture_numとimage_countは揃える"5" ※②
        appendDropBox(image_count+1,picture_num+1)                                   //※②①を引数にDrophereを作成
    }
  });
  $(document).on('change', 'input[type= "file"]',function(e) {
    if ($(this).parent().hasClass('drophere')){
      var image_count = $('.re__sell-upload-drop-box__file').last().data('image')  //既存5枚の場合,drophereも含めて"6"
      picture_num += 1                                                             //inputに画像が１枚入ったのでpicture_numに1+する 既存5枚の場合"6" ※③
      var file = $(this).prop('files')[0];                                         //以下inputタグに写真データを入れたままゴリ押しでプレビュー表示まで成形(inputデータ自体を取得するのはできないらしい)
      var blobUrl = window.URL.createObjectURL(file);
      var preview =`<img src="${blobUrl}" width="114" height="116">`
      $('.re__sell-upload-drop-box__text').remove();
      $(this).wrap(`<div class="re__btn_wrapper"><label class="btn re__edit" for="re__sell-upload-drop-box__file_${image_count-1}">編集</label><div class="btn re__delete">削除</div></div>`)
      $('.re__sell-upload-drop-box').prepend(preview).removeAttr('style').removeClass("re__sell-upload-drop-box drophere").addClass("re__sell-upload-item")
      $.when(
      renumbering()                                                               //idとimage-data,親のlabelのforの連番を再配布
      ).done(function(){
        image_count = $('.re__sell-upload-drop-box__file').length                 //既存5枚の場合,成形した1枚も含めて"6" ※④
        appendDropBox(image_count,picture_num + 1)                                //※④③を引数にDrophereを作成
      })
    }
  })
    $(document).on('click', '.re__delete', function() {
      $(this).parent().parent().hide();                                         //削除ボタンの親の親ごと削除
      $(this).find('.re__sell-upload-drop-box__delete-flag').prop('checked', true);
      var delete_item = $(this).prev().children().attr('value')                   //削除ボタンの上隣の子どものvalue取得
      if (delete_item){                                                           //削除対象にvalueがあれば(既存は有り、新規はなし)
      delete_items.push(delete_item)                                              //削除対象のvalueを配列に追加
      console.log(delete_items)

      }
      $.when(
      renumbering()                                                               //idとimage-data,親のlabelのforの連番を再配布
      ).done(function(){
      image_count = $('.re__sell-upload-drop-box__file').length                   //既存5枚で1枚削除した場合,drophereも含めて"5"
      appendDropBox(image_count - 1, picture_num + 1)
      })
    })
  })