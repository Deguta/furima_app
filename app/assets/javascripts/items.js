$(document).on('turbolinks:load', ()=> {
  // 画像用のinputを生成する関数
  const buildFileField = (index)=> {
    const html = `<div class="js-file_group" data-index="${index}">
    <input class="js-file" type="file" name="item[item_images_attributes][${index}][image]" id="item_item_images_attributes_${index}_image">
    <br>
    <span class="js-remove">削除</span>
    </div>`;
    return html;
  }

  console.log("ok");
  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  $('.shipping-page__box').on('change', '.js-file', function(e) {
    // fileIndexの先頭の数字を使ってinputを作る
    $('.js-file_group').append(buildFileField(fileIndex[0]));
    fileIndex.shift();
    // 末尾の数に1足した数を追加する
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  });

  $('#image-box').on('click', '.js-remove', function() {
    $(this).parent().remove();
    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });
});