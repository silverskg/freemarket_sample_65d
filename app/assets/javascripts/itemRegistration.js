$(document).on('turbolinks:load', function() {
  //カテゴリ選択時にブランドフォームを追加
  $("#_category").on("change", function(){
    console.log("発火");
    $("#brand").show();
  })

  // 販売手数料の表示
  $(".rightSmallForm__price").on("keyup", function(){
    let input = $(this).val();
    if (input > 300) {
      $(".rightSmallForm__commissionPrice").text(`¥${Math.floor(input * 0.1)}`);
    }
    else
      $(".rightSmallForm__commissionPrice").text("-");
  })
  // 販売利益の表示
  $(".rightSmallForm__price").on("keyup", function(){
    let input = $(this).val();
    if (input > 300) {
      $(".rightSmallForm__profitPrice").text(`¥ ${input - (Math.floor(input * 0.1))}`);
    }
    else
      $(".rightSmallForm__profitPrice").text("-");
  })
}); 