$(function(){
  // モーダルウィンドウが開くときの処理
  $(".modal-open-btn").click(function(){

      var navClass = $(this).attr("class"),
          href = $(this).attr("href");
          $(href).fadeIn();
      $(this).addClass("open");
      $('html').addClass("overLay");
      return false;
  });

  // モーダルウィンドウが閉じるときの処理
  $(".modal-close-btn").click(function(){
      $(this).parents(".modal").fadeOut();
      $(".modalOpen").removeClass("open");
      return false;
  });

  });
