$(function(){
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
    childSelectHtml = `<div class="sell-form-group band-forms">
                        <label for="item_ブランド">ブランド</label>
                        <span class="sell-form-group__arbitrary">任意</span>
                          <div class="sell-form-group__select-wrap level1_category--form">
                            <input class="sell-form-group__input-default" placeholder="例）入力禁止。brand_id:2が自動入力されます" type="text" name="item[brand_id]" id="item_brand_id">
                          </div>
                      </div>`
    $('.add-forms').append(childSelectHtml);
  }
  $('#level1_category').on('change',function(e){
    e.preventDefault();
    $('.level1_category--form').nextAll().remove();
    $('.size-forms').remove();
    $('.band-forms').remove();
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
    $('.size-forms').remove();
    $('.band-forms').remove();
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
        appendBrandForm();
      }
    })
    .fail(function(){
      alert('失敗しました')
    })
  })
  $(document).on('change','#level3_category',function(e){
    e.preventDefault();
    $('.size-forms').remove();
    $('.band-forms').remove();
    var level3_category_val = Number($(this).val());
    $.ajax({
      type:'GET',
      url:'/items/get_size_children',
      data: {parent_id: level3_category_val},
      dataType:'json'
    })
    .done(function(children){
      var insertHTML = '';
      console.log(children)
      var option_type = 'size';
      if(children.length !=0){
        children.forEach(function(child){
          insertHTML += appendOption(child,option_type);
        });
        appendSizeForm(insertHTML);
      }
      appendBrandForm();
    })
    .fail(function(){
      alert('失敗しました')
    })
  })
})