jQuery(document).ready(function($) {
  $(".search-product").keyup(function(event) {
    var key = $(this).val();
    if(key == "")
    {
      $(".list-search").css("display","none");
    }
    else{
      $.ajax({
      url : "admin/searchs",
      type : "GET",
      dataType:"script",
      data : {
           search : key
        }
      });
      $(".list-search").css("display","block");
    }
  });
});
