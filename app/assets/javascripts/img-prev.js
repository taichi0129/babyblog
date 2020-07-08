$(function() {
  var file_field = document.querySelector('input[type="file"]');
  $('.hidden-file').change(function() {
    var file = $('input[type="file"]').prop('files')[0];
    var fileReader = new FileReader();
    fileReader.onloadend = function() {
      var src = fileReader.result;
      var html = `<div class="image-form">
                    <img src="${src}" class="image-data">
                  </div>`;
      $('.hidden-image').after(html);
    }
    fileReader.readAsDataURL(file);
    if ($('.preview-image').length != 0) {
      $('.image-data').remove();
      $('.preview-image .image-data').attr({ src: src });
    }
  });
});