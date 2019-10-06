$(function(){
  $(document).on('click','.unliked',function(e){
    e.preventDefault();
    var item_id = Number($(this).data('item'))
    $.ajax({
      type:'get',
      url:`/likes/${item_id}/create`,
      data:{id: item_id},
      dataType:'json'
    })
    .done(function(likes){
      $('.unliked').addClass('liked').removeClass('unliked');
      $('.like_count').text(likes.length)
    })
    .fail(function(){
      alert('失敗しました')
    })
  })
  $(document).on('click','.liked',function(e){
    e.preventDefault();
    var item_id = Number($(this).data('item'))
    $.ajax({
      type:'get',
      url:`/likes/${item_id}/destroy`,
      data:{id: item_id},
      dataType:'json'
    })
    .done(function(likes){
      $('.liked').addClass('unliked').removeClass('liked');
      $('.like_count').text(likes.length)
    })
    .fail(function(){
      alert('失敗しました')
    })
  })
})