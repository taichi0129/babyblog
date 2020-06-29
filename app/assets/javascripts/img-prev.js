$(function() {
  var file_field = document.querySelector('input[type="file"]');
  $('.hidden-file').change(function() {
    var file = $('input[type="file"]').prop('files')[0];
    var fileReader = new FileReader();
    fileReader.onloadend = function() {
      var src = fileReader.result;
      var html = `<img src="${src}" class="image-data">`;
      $('.preview-image').after(html);
    }
    fileReader.readAsDataURL(file);
  });
});