$(function(){
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
  function appendOption(child,option_type){
    if (option_type =='category'){
      var option_value = child.name
    }else if (option_type =='size'){
      var option_value = child.kind
    }
    var html = `<option value="${child.id}" data-${option_type}="${child.id}">${option_value}</option>`;
    return html;
  }
  function appendCategoryForm(insertHTML,level){
    var childSelectHtml = '';
    childSelectHtml = `<div class="sell-form-group__select-wrap ${level}--form">
                        <i class="sell-form-group__select-wrap--icon fas fa-chevron-down"></i>
                        <select class="sell-form-group__select-wrap--default" id=${level} name="item[category_id]">
                          <option value="">---</option>
                          ${insertHTML}
                        </select>
                      </div>`;
    $('.category-forms').append(childSelectHtml);
  }
  function appendSizeForm(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<div class="sell-form-group size-forms">
                        <label for="item_サイズ">サイズ</label>
                        <span class="sell-form-group__require">必須</span>
                        <div class="sell-form-group__select-wrap">
                          <i class="sell-form-group__select-wrap--icon fas fa-chevron-down"></i>
                          <select class="sell-form-group__select-wrap--default" name="item[size_id]">
                            <option value="">---</option>
                            ${insertHTML}
                          </select>
                        </div>
                      </div>`
    $('.add-forms').append(childSelectHtml);
  }
  function appendBrandForm(){
    var childSelectHtml = '';
    childSelectHtml = `<div class="sell-form-group brand-forms">
                        <label for="item_ブランド">ブランド</label>
                        <span class="sell-form-group__arbitrary">任意</span>
                        <div class="sell-form-group__select-wrap">
                            <input class="sell-form-group__input-default" id="item_brand_id" placeholder="例) シャネル" type="text" >
                            <input id="brand-form" class="sell-form-group__input-default" value="" type="hidden" name="item[brand_id]">
                          <div>
                            <ul class="sell-brand-suggest form-suggest-list"></ul>
                          </div>
                        </div>
                      </div>`
    $('.brand-forms').remove();
    $('.add-forms').append(childSelectHtml);
  }
  function resetSizeBrandForm(){
    var resetSizeValueHtml =''
    resetSizeValueHtml =`<div class="sell-form-group size-forms reset-form">
                            <select class="sell-form-group__select-wrap--default" name="item[size_id]">
                            <option selected="selected" value="">---</option>
                          </div>`
    var resetBrandValueHtml =''
    resetBrandValueHtml =`<div class="sell-form-group brand-forms reset-form">
                            <input id="brand-form" class="sell-form-group__input-default" value="" type="hidden" name="item[brand_id]">
                          </div>`
    $('.size-forms').remove();
    $('.brand-forms').remove();
    $('.add-forms').append(resetSizeValueHtml)
    $('.add-forms').append(resetBrandValueHtml)
  }
  $('#level1_category').on('change',function(e){
    e.preventDefault();
    $('.level1_category--form').nextAll().remove();
    resetSizeBrandForm()
    var level1_category_val = Number($(this).val())
    if (level1_category_val !=""){
      $.ajax({
        type:'GET',
        url:'/items/get_category_children',
        data: {parent_id: level1_category_val},
        dataType:'json'
      })
      .done(function(children){
        var insertHTML = '';
        var option_type = 'category';
        var level='level2_category';
        children.forEach(function(child){
          insertHTML += appendOption(child,option_type);
        });
        appendCategoryForm(insertHTML,level);
      })
      .fail(function(){
        alert('失敗しました')
      })
    }
  })
  $(document).on('change','#level2_category',function(e){
    e.preventDefault();
    $('.level2_category--form').nextAll().remove();
    resetSizeBrandForm()
    var level2_category_val = Number($(this).val());
    $.ajax({
      type:'GET',
      url:'/items/get_category_children',
      data: {parent_id: level2_category_val},
      dataType:'json'
    })
    .done(function(children){
      var insertHTML = '';
      var option_type = 'category';
      var level = 'level3_category';
      if(children.length !=0){
        children.forEach(function(child){
          insertHTML += appendOption(child,option_type);
        });
        appendCategoryForm(insertHTML,level);
      }
    })
    .fail(function(){
      alert('失敗しました')
    })
    $.ajax({
      type:'GET',
      url:'/items/get_size_children',
      data: {parent_id: level2_category_val},
      dataType:'json'
    })
    .done(function(children){
      var insertHTML = '';
      var option_type = 'size';
      if(children.length !=0){
        children.forEach(function(child){
          insertHTML += appendOption(child,option_type);
        });
        appendSizeForm(insertHTML);
        if (getBrandGroupId()!= 0){
          appendBrandForm();
        }
      }
    })
    .fail(function(){
      alert('失敗しました')
    })
  })
  $(document).on('change','#level3_category',function(e){
    e.preventDefault();
    resetSizeBrandForm()
    var level3_category_val = Number($(this).val());
    $.ajax({
      type:'GET',
      url:'/items/get_size_children',
      data: {parent_id: level3_category_val},
      dataType:'json'
    })
    .done(function(children){
      var insertHTML = '';
      var option_type = 'size';
      if(children.length !=0){
        children.forEach(function(child){
          insertHTML += appendOption(child,option_type);
        });
        appendSizeForm(insertHTML);
      }
      if (getBrandGroupId()!= 0){
        appendBrandForm();
      }
    })
    .fail(function(){
      alert('失敗しました')
    })
  })
})