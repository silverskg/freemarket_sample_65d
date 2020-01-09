$(function() {
  $('.picsmall1').click(function(){
    var dataUrl = $(this).attr('src');
    $(".picmain").attr('src',dataUrl);
  });
});