$(document).on('turbolinks:load', function() {
  // クリックしたときの関数
  $('.mypage-tabs li').click(function() {
    console.log(this)
    // 〜〜コンテンツについての処理〜〜
    //クリックされたタブの番号をindexに格納。
    var index = $('.tab li').index(this);
    //コンテンツを一旦全て非表示に。
    $('.content li').css('display','none');
    // クリックされた番号のコンテンツを表示。
    $('.content li').eq(index).css('display','block');


    // 〜〜タブについての処理〜〜
    // 一度タブについている'tab_current'を消し
    $('.mypage-tabs li').removeClass('active');
    //クリックされたタブのみに'tab_current'をつける。
    $(this).addClass('active')
    });
  $('.purchase-tabs li').click(function() {
    console.log(this)
    $('.purchase-tabs li').removeClass('present');
    $(this).addClass('present')
  });
});