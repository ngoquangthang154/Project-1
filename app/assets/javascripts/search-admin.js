jQuery(document).ready(function($) {
  $(".search-product").keyup(function(event) {
    var key = $(this).val();
    if(key == "")
    {

    }
    else{
      $.ajax({
      url : "/admin/searchs",
      type : "GET",
      dataType:"script",
      data : {
           search : key
        }
      });

    }
  });
  $(document.body).on('click','#sidebarCollapse', function () {
    $('#sidebar').toggleClass('active');
  });


  var submitIcon = $('.searchbox-icon');
      var inputBox = $('.searchbox-input');
      var searchBox = $('.searchbox');
      var isOpen = false;
      submitIcon.click(function(){
            if(isOpen == false){
                  searchBox.addClass('searchbox-open');
                  inputBox.focus();
                  isOpen = true;
            } else {
                  searchBox.removeClass('searchbox-open');
                  inputBox.focusout();
                  isOpen = false;
            }
      });
      submitIcon.mouseup(function(){
            return false;
      });
      searchBox.mouseup(function(){
            return false;
      });
      $(document).mouseup(function(){
            if(isOpen == true){
                  $('.searchbox-icon').css('display','block');
                  submitIcon.click();
            }
      });
});

function buttonUp(){
      var inputVal = $('.searchbox-input').val();
      inputVal = $.trim(inputVal).length;
      if( inputVal !== 0){
            $('.searchbox-icon').css('display','block');
      } else {
            $('.searchbox-input').val('');
            $('.searchbox-icon').css('display','block');
      }
}
