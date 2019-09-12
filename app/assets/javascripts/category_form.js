$(function(){
  function appendOption(category){
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
    // 子カテゴリーの表示作成
    function appendChidrenBox(insertHTML,flag){
      var childSelectHtml = '';
      childSelectHtml = `<div class="sell-form-group__select-wrap category-level2-form">
        <i class="sell-form-group__select-wrap--icon fas fa-chevron-down"></i>
        <select class="sell-form-group__select-wrap--default" id=${flag} name="item[category_id]">
          <option value="">---</option>
          ${insertHTML}
        </select>
      </div>`;
      $('.category-forms').append(childSelectHtml);
    }

  $('#level1_category').on('change',function(e){
    e.preventDefault();
    var level1_category_val=Number($(this).val())
    $.ajax({
      type:'GET',
      url:'/items/get_category_children',
      data: {parent_id: level1_category_val},
      dataType:'json'
    })
    .done(function(children){
      var insertHTML = '';
      var flag='level2_category';
      children.forEach(function(child){
        insertHTML += appendOption(child);
      });
      appendChidrenBox(insertHTML,flag);
    })
    .fail(function(){
      alert('失敗しました')
    })
  })
  $(document).on('change','#level2_category',function(e){
    e.preventDefault();
    var level2_category_val = Number($(this).val())
    $.ajax({
      type:'GET',
      url:'/items/get_category_children',
      data: {parent_id: level2_category_val},
      dataType:'json'
    })
    .done(function(children){
      var insertHTML = '';
      var flag = 'level3_category';
      children.forEach(function(child){
        insertHTML += appendOption(child);
      });
      appendChidrenBox(insertHTML,flag);
    })
    .fail(function(){
      alert('失敗しました')
    })
  })
})