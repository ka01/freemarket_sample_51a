$(function(){
  function appendBrand(brand){
    var html=`<li id = "${brand.id}" class="brand_select">${brand.name}</li>`
    return html;
  }
  function getBrandGroupId(){
    var level1_id = $("#level1_category").find('option:selected').text()
    var level2_id = $("#level2_category").find('option:selected').text()
    var level3_id = $("#level3_category").find('option:selected').text()
    if (level3_id == '国内自動車本体'){
      return 15
    }else if (level3_id == '外国自動車本体'){
      return 16
    }else if (level2_id == 'キッチン・食器'){
      return 5
    }else if (level2_id == '時計'){
      return 6
    }else if (level2_id == 'テレビゲーム'){
      return 8
    }else if (level2_id.match(/オートバイ/)){
      return 11
    }else if (level2_id.match(/楽器/)){
      return 12
    }else if (level2_id.match(/自動車/)){
      return 13
    }else if (level2_id == '食品'){
      return 14
    }else if (level1_id == 'レディース'){
        return 1
    }else if (level1_id == 'メンズ'){
      return 2
    }else if (level1_id == 'ベビー・キッズ'){
      return 3
    }else if (level1_id == 'インテリア・住まい・雑貨'){
      return 4
    }else if (level1_id == 'コスメ・香水・美容'){
      return 7
    }else if (level1_id == 'スポーツ・レジャー'){
      return 9
    }else if (level1_id == '家電・スマホ・カメラ'){
      return 10
    }else{
      return 0
    }
  }
  $(document).on('keyup', "#item_brand_id",function() {
    var brand_group_id=''
    brand_group_id = getBrandGroupId()
    var input=$(this).val();
    $.ajax({
      type:'GET',
      url: '/brand',
      data: { keyword: input,
              id: brand_group_id},
      dataType:'json'
    })
    .done(function(brands){
      $(".sell-brand-suggest").empty();
      var insertHTML = '';
      var added_brand_ids=[]
      if (input.length != 0 ){
        brands.forEach(function(brand){
          insertHTML += appendBrand(brand);
        });
      }
      $('.sell-brand-suggest').append(insertHTML)
    })
    .fail(function(){
      alert('失敗しました')
    })
  })
  $(document).on('click',".brand_select",function(){
    $("#item_brand_id").val($(this).text())
    $("#brand-form").val($(this).attr('id'))
    $(".sell-brand-suggest").children().remove()
  })
})