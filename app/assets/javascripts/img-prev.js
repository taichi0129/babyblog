$(function() {
  var file_field = document.querySelector('input[type="file"]');
  $('.hidden-file').change(function() {
    var file = $('input[type="file"]').prop('files')[0];
    var fileReader = new FileReader();
    fileReader.onloadend = function() {
      var src = fileReader.result;
      var html = `<div class="image-form">
                    <img src="${src}" class="image-data">
                  </div>
                  <p><a href="#" class="img_del">画像を削除する</a></p>`;
      $('.hidden-image').after(html);
      $('.hidden-image').css('display', 'none');
    }
    fileReader.readAsDataURL(file);
    if ($('.preview-image').length != 0) {
      $('.image-data').remove();
      $('.preview-image .image-data').attr({ src: src });
    }
  });
  function img_del(target){
    target.find("a.img_del").on('click',function(){
      var self = $(this),
          parentBox = self.parent().parent().parent();
      if(window.confirm('画像を削除します。\nよろしいですか？')){
        setTimeout(function(){
          parentBox.find('input[type=file]').val('');
          parentBox.find('.image-form').remove();
        } , 0);
      }
      return false;
    });
  }
});