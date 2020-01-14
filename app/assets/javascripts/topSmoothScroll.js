$(document).on('turbolinks:load', function() {
  //人気のカテゴリーをクリックするとイベント発火
  $('.btn-gradient-radius').click(function() {

    // スクロールの速度
    var speed = 300; // ミリ秒で記述
    // アンカーの値取得
    var href = $(this).attr("href");
    // 移動先を取得
    var target = $(href == "#" || href == "" ? 'html' : href);
    // 移動先を数値で取得
    var position = target.offset().top;
  
    // スムーススクロール
  $('body,html').animate({
    scrollTop: position
  }, speed, 'swing');
  return false;
});
});