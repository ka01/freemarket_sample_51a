$(function(){

  function buildBOX1(){
    var category_box = `<i class="fas fa-chevron-down"></i><select maxlength="40" name="q[category_id_eq]" id="category_box_5" class="ransack-select"><option value="">---</option>`
    return category_box;
  }

  function buildBOX2(){
    var category_box = `<div class="append_box"><i class="fas fa-chevron-down"></i><select maxlength="40" name="q[category_id_eq]" id="category_box_6" class="ransack-select"><option value="">---</option></div>`
    return category_box;
  }

  function buildCHILDREN(value){
    var category_children = `<option value="${value.id}">${value.name}</option> `
    return category_children;
  }

  $('#ransack_category_id').on('change', function(){
    var id = this.value;
    $.ajax({
        url: '/items/get_category_children',
        type: "GET",
        data: { parent_id: id },
        dataType: 'json'
      })
      .done(function(data){
        $('#category_box_5').remove();
        $('.append_box').remove();
        html = buildBOX1(data)
        $("#category_children").append(html);
        data.forEach(function( children ) {
          html = buildCHILDREN(children);
          $("#category_box_5").append(html);
          });
      })
      .fail(function(){
        alert('正しくありません');
      })
  });

  $(document).on('change','#category_box_5', function(){
    var id = this.value;
    $.ajax({
        url: '/items/get_category_children',
        type: "GET",
        data: { parent_id: id },
        dataType: 'json'
      })
      .done(function(data){
        if (data.length){
          $('#category_box_6').remove();
          html = buildBOX2(data);
          $("#category_grandchildren").append(html);
          data.forEach(function( grandchildren ) {
            html = buildCHILDREN(grandchildren);
            $("#category_box_6").append(html);
          });
        };
      })
      .fail(function(){
        alert('正しくありません');
      })
  });
});

$(function() {
  $('.hidden-select-box__search-box').click(function() {
    $('.items-box-container').toggle();
  })
});