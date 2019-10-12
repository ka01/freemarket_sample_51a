// $(function(){

//     // 指定部分にドラッグしたときの処理
//     $(".drophere").on("dragenter", function(e){
//       console.log("DragEnter");
//     });

//     // 指定部分の上に乗っかっているときの処理
//   $(document).on('dragover', '.drophere', function(e) {

//     // $(".drophere").on("dragover", function(e){
//       e.preventDefault();
//       console.log("DragOver");
//     });

//     // 指定部分から離れたときの処理
//     $(".drophere").on("dragleave", function(e){
//       console.log("DragLeave");
//     });

//     // 指定部分でドロップしたときの処理
//   $(document).on('drop', '.drophere', function(e) {
//     // $(".drophere").on("drop", function(e){
//       // var e = _e;
//       e.preventDefault();
//       console.log( e.originalEvent.dataTransfer.files)
//       // $('input[type=file]')[0].files[0] = e.originalEvent.dataTransfer.files;
//       document.getElementById("re__sell-upload-drop-box__file").files = e.originalEvent.dataTransfer.files;
//       // $(".re__sell-upload-drop-box__file").prop('files')[0] = e.dataTransfer;
//       console.log("Drop");
//     });
//     // dropArea.addEventListener(’drop’, function(evt){
//     //   input.files = evt.dataTransfer.files;
//     //   });
// })