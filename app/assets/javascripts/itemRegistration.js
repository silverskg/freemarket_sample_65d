$(function() {
  //アップロード画像の番号
  let fileIndex = [1,2,3,4,5,6,7,8,9,10,11];

  //アップロード画像枚数
  let image_num = 0;

  //アップロードした画像のプレビュー(top)
  $(document).on("change", ".imageUpField__hidden", function(e){
    //HTML作成
    const targetIndex = $(this).data("index");
    let file = e.target.files[0];
    let bolbUrl = window.URL.createObjectURL(file);
    let html = `<div class="preview" data-index="${targetIndex}">
                  <img src=${bolbUrl}>
                  <div class="preview__buttons">
                    <div class="editBtn">編集</div>
                    <div class="deleteBtn">削除</div>
                  </div>
                </div>`;
    
    //file_fieldの大きさ変更
    $(".imageUpField").removeClass(`image_num_${image_num}`);
    $(".imageUpField").addClass(`image_num_${image_num + 1}`);

    $(".dropText").removeClass(`num_${image_num}`);
    $(".dropText").addClass(`num_${image_num + 1}`);

    // 画像の追加
    if ($(".preview").length) {
      let num = $(".preview").length; 
      let i = 0;
      while(true) {
        $(`div[data-index="${targetIndex - i}"].preview`).after(html);
        if ($(".preview").length == num + 1) {
          break;
        }
        i ++;
      }
    }
    else {
      $(".previewField").prepend(html);
    }

    image_num += 1;

    //previewFieldの調整
    if (image_num > 4 ) {
      $(".previewField").height("364px");
    }

    //file_fieldの追加(top)
    let fileFieldHtml =`<input name="item[images_attributes][${fileIndex[0]}][image]" 
                        class="imageUpField__hidden" 
                        data-index="${fileIndex[0]}"
                        type="file">`;
    fileIndex.shift();
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    $(".imageUpField").append(fileFieldHtml);
    $(".imageUpField").children(":last").show();
    $(this).hide();
  })

  //画像の削除(top)
  $(document).on("click", ".deleteBtn", function(){
    const targetIndex = $(this).parent().parent().data("index");

    //DBに保存されている画像を消す場合
    if ($(`input[data-index="${targetIndex}"].imageUpField__hidden`).hasClass("edit")){
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }

    //画像とfile_fieldの削除
    $(`input[data-index="${targetIndex}"].imageUpField__hidden`).remove();
    $(this).parent().parent().remove();

    //file_fieldの大きさ変更
    $(".imageUpField").removeClass(`image_num_${image_num}`);
    $(".imageUpField").addClass(`image_num_${image_num - 1}`);

    $(".dropText").removeClass(`num_${image_num}`);
    $(".dropText").addClass(`num_${image_num - 1}`);

    image_num -= 1;

    //DBに保存されている画像をDBから削除するフラグをつける
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden_destroy`);
    if (hiddenCheck) {
      hiddenCheck.prop("checked", true);
    }

    //previewFieldの調整
    if (image_num < 5 ) {
      $(".previewField").height("162px");
    }
  })

  //ページ遷移時にimageがすでにある状態の場合
  $(document).on('turbolinks:load', function() {
    if ($(".preview").length) {
      let lastIndex = ($(".preview").last().data('index'));
      fileIndex.splice(0, lastIndex + 1);
      image_num = (lastIndex + 1);

      //previewFieldの調整
      if (image_num > 4 ) {
        $(".previewField").height("364px");
      }
    }
  })

});

$(document).on('turbolinks:load', function() {
  //カテゴリ選択状態で遷移した場合
  if ($("#item_category_id").val()){
    $("#brand").show();
  }

  //カテゴリ選択時にブランドフォームを追加
  $("#item_category_id").on("change", function(){
    $("#brand").show();
  })

  //配送方法選択状態で遷移した場合
  if ($("#item_deliver_fee").val()){
    $("#how_to_deliver").show();
  }

  //配送料の負担選択時に発送方法フォームを追加
   $("#item_deliver_fee").on("change", function(){
      let select = $(this).val();
      if (select == "送料込み(出品者負担)") {
        let url = `<option value="---">---</option>
                   <option value="未定">未定</option>
                   <option value="らくらくメルカリ便">らくらくメルカリ便</option>
                   <option value="ゆうメール">ゆうメール</option>
                   <option value="レターパック">レターパック</option>
                   <option value="普通郵便(定形、定形外)">普通郵便(定形、定形外)</option>
                   <option value="クロネコヤマト">クロネコヤマト</option>
                   <option value="ゆうパック">ゆうパック</option>
                   <option value="クリックポスト">クリックポスト</option>
                   <option value="ゆうパケット">ゆうパケット</option>`;
        $("#how_to_deliver").show();
        $("#item_how_to_deliver").empty();
        $("#item_how_to_deliver").append(url);
      }
      else if (select == "着払い(購入者負担)") {
        let url = `<option value="---">---</option>
                   <option value="未定">未定</option>
                   <option value="クロネコヤマト">クロネコヤマト</option>
                   <option value="ゆうパック">ゆうパック</option>
                   <option value="ゆうメール">ゆうメール</option>`;
        $("#how_to_deliver").show();
        $("#item_how_to_deliver").empty();
        $("#item_how_to_deliver").append(url);
      }
      else {
        $("#how_to_deliver").hide();
      }
   })

  //価格入力状態で遷移した場合
  let input = $(".rightSmallForm__price").val();
  if (input) {
    if (input >= 300) {
      $(".rightSmallForm__commissionPrice").text(`¥${Math.floor(input * 0.1)}`);
    }
    else
      $(".rightSmallForm__commissionPrice").text("-");
  }

  if (input) {
    if (input >= 300) {
      $(".rightSmallForm__profitPrice").text(`¥${Math.floor(input * 0.1)}`);
    }
    else
      $(".rightSmallForm__profitPrice").text("-");
  }

  // 販売手数料の表示
  $(".rightSmallForm__price").on("keyup", function(){
    let input = $(this).val();
    if (input >= 300) {
      $(".rightSmallForm__commissionPrice").text(`¥${Math.floor(input * 0.1)}`);
    }
    else
      $(".rightSmallForm__commissionPrice").text("-");
  })
  // 販売利益の表示
  $(".rightSmallForm__price").on("keyup", function(){
    let input = $(this).val();
    if (input >= 300) {
      $(".rightSmallForm__profitPrice").text(`¥ ${input - (Math.floor(input * 0.1))}`);
    }
    else
      $(".rightSmallForm__profitPrice").text("-");
  })
}); 