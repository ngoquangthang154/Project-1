$(document).ready(function(){
  setTimeout(function() {
  $('.alert-success').fadeOut();
}, 3000);

$('#product_img_detail').bind('change', function() {
    var size_in_megabytes = this.files[0].size/1024/1024;
    if (size_in_megabytes > 5) {
      alert('Maximum file size is 5MB. Please choose a smaller file.');
    }
  });
});