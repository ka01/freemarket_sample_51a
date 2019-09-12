$(function(){
  function appendOption(category){
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  function appendChildForm(insertHTML,level){
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


  $('#level1_category').on('change',function(e){
    e.preventDefault();
    $('.level1_category--form').nextAll().remove();
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
        var level='level2_category';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChildForm(insertHTML,level);
      })
      .fail(function(){
        alert('失敗しました')
      })
    }
  })
  $(document).on('change','#level2_category',function(e){
    e.preventDefault();
    $('.level2_category--form').nextAll().remove();
    var level2_category_val = Number($(this).val())
    $.ajax({
      type:'GET',
      url:'/items/get_category_children',
      data: {parent_id: level2_category_val},
      dataType:'json'
    })
    .done(function(children){
      var insertHTML = '';
      var level = 'level3_category';
      if(children.length !=0){
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChildForm(insertHTML,level);
      }
    })
    .fail(function(){
      alert('失敗しました')
    })
  })
})