$(document).on('turbolinks:load', ()=> {
  // 画像用のinputを生成する関数
  const buildFileField = (index)=> {
    const html = `<div class="js-file_group" data-index="${index}">
                  <input class="js-file" type="file" name="item[item_images_attributes][${index}][image]" id="item_item_images_attributes_${index}_image">
                  </div>
                  `;
    return html;
  }
  // プレビュー用のimgタグを生成する関数
  const buildImg = (index, url)=> {
    const html = `<div data-index="${index}">
                    <img class="js-img" id="image-box" src="${url}" width="90px" height="110px">
                    <div class="js-remove">削除</div>
                  </div>`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  // 既に使われているindexを除外
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);
  $('.hidden-destroy').hide();
  
  $('.shipping-page__box').on('change', '.js-file', function(e) {
    //追記
    // debugger
    const targetIndex = $(this).parent().parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    // 該当indexを持つimgタグがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else { // 新規画像追加の処理
      $('.shipping-page__box__previews').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('#image-box').append(buildFileField(fileIndex[0]));
      $('.label').attr('for', `item_item_images_attributes_${fileIndex[0]}_image`)
    }
    // fileIndexの先頭の数字を使ってinputを作る
    $('.shipping-page__box__file').append(buildFileField(fileIndex[0]));
    fileIndex.shift();
    // 末尾の数に1足した数を追加する
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  });
    //５１行目ページ全体の中のjs-removeがclickされたら58行目
    //this= js-remove 削除の事
  $(document).on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index');
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`#item_item_images_attributes_${targetIndex}__destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();
    $(`#item_item_images_attributes_${targetIndex}_image`).remove();
    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });
});