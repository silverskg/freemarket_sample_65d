$(document).on('turbolinks:load', function() {

  //小さい画像にマウス乗った時に発火
  $('.picsmall1').mouseover(function(){


    //下で追加する情報をリセット
    $('.picsmall1').removeAttr('id','Choice');
    $('.picsmall1').removeAttr('style');
    
    //クリックされた画像URLをdataUrlに置き換え
    let dataUrl = $(this).attr('src');
  
    //大きい画像が表示してる所のURLを変更
    $(".picmain").attr('src',dataUrl);

    //idを追加    
    $(this).attr('id', 'Choice');

    //css要素追加
    $('#Choice').css('opacity','1');
  });  
});
