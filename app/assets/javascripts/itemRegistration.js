$(document).on('turbolinks:load', function() {
  //アップロードされた画像の数
  let top_image_num = 0;
  let bottom_image_num = 0;

  //アップロードした画像のプレビュー(top)
  $(".imageUpField__hidden1").on("change", function(e){
    let file = e.target.files[0];
    let bolbUrl = window.URL.createObjectURL(file);
    let url = `<div class="preview">
                  <img src=${bolbUrl}>
                  <div class="preview__buttons">
                    <div class="editBtnTop">編集</div>
                    <div class="deleteBtnTop">削除</div>
                  </div>
                </div>
              `;

    //画像UP処理(top)
    if(top_image_num < 4) {
      $(".previewField#pf1").append(url);
      $(this).val("");
      top_image_num += 1;
    }
    else if(top_image_num == 4) {
      $(".previewField#pf1").append(url);
      $(this).val("");
      top_image_num += 1;
      $("#images1").hide();
      $("#images2").show();
    }
  })

  //画像の削除(top)
  $(document).on("click", ".deleteBtnTop", function(){
    if(top_image_num == 5 && bottom_image_num == 0) {
      $("#images1").show();
      $("#images2").hide();
    }

    if(top_image_num == 5 && bottom_image_num > 0) {
      $("#images1").show();
    }

    $(this).parent().parent().remove();
      top_image_num -= 1;
  })

  //アップロードした画像のプレビュー(bottom)
  $(".imageUpField__hidden2").on("change", function(e){
    let file = e.target.files[0];
    let bolbUrl = window.URL.createObjectURL(file);
    let url = `<div class="preview">
                  <img src=${bolbUrl}>
                  <div class="preview__buttons">
                    <div class="editBtnBottom">編集</div>
                    <div class="deleteBtnBottom">削除</div>
                  </div>
                </div>
              `;

    //画像UP処理(bottom)
    if(bottom_image_num < 4) {
      $(".previewField#pf2").append(url);
      $(this).val("");
      bottom_image_num += 1;
    }
    else if(bottom_image_num == 4) {
      $(".previewField#pf2").append(url);
      $(this).val("");
      bottom_image_num += 1;
      $("#images2").hide();
    }
  })

  //画像の削除(bottom)
  $(document).on("click", ".deleteBtnBottom", function(){
    if(bottom_image_num == 5) {
      $("#images2").show();
    }

    $(this).parent().parent().remove();
      bottom_image_num -= 1;
  })

  //カテゴリ選択時にブランドフォームを追加
  $("#item_category_id").on("change", function(){
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