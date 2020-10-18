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
  $('.hidden-destroy').hide();
  
  $('.shipping-page__box').on('change', '.js-file', function(e) {
    //追記
    // debugger
    
    let targetIndex = $(this).parents('.js-file_group').data('index');
    console.log(targetIndex)
    console.log(this)
    targetIndex = Number(targetIndex)
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    // 該当indexを持つimgタグがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else { // 新規画像追加の処理
      $('.shipping-page__box__previews').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      // console.log(fileIndex[0])
      targetIndex = targetIndex + 1;
      console.log(targetIndex)
      $('.shipping-page__box_images').append(buildFileField(targetIndex));
      $('.label').attr('for', `item_item_images_attributes_${targetIndex}_image`)
    }
    // fileIndexの先頭の数字を使ってinputを作る
    // $('.shipping-page__box__file').append(buildFileField(targetIndex+1));
    // fileIndex.shift();
    // 末尾の数に1足した数を追加する
    // fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  });
    //５１行目ページ全体の中のjs-removeがclickされたら58行目
    //this= js-remove 削除の事
  $(document).on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index');
    console.log(targetIndex)
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`#item_item_images_attributes_${targetIndex}__destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    console.log(this)
    $(this).parent().remove();
    // $(`img[data-index="${targetIndex}"]`).remove();
    // $(`#item_item_images_attributes_${targetIndex}_image`).remove();
    // 画像入力欄が0個にならないようにしておく
    // if (!($('.js-file').length)){
    //   console.log("ok")
    //   $('#image-box').append(buildFileField(targetIndex+1));
    // } 
    // $('.label').attr('for', `item_item_images_attributes_${fileIndex[0]}_image`)
  });
});