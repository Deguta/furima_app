$(document).on('turbolinks:load', function(){
  $(function(){
    // カテゴリーセレクトボックスのオプションを作成
    function appendOption(category){
      var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
      return html;
    }
    // 子カテゴリーの表示作成 iのfasは下矢印
    function appendChidrenBox(insertHTML){
      var childSelectHtml = '';
      childSelectHtml = `<div class='shipping-page__box__category-select--added1' id= 'children_wrapper'>
                          <i class='fas fa-chevron-down shipping-page__box__category-select--arrow-down1'></i> 
                            <select class="shipping-page__box__category-select--choose2" id='child_category' name="item[category_id]">
                              <option value="---" data-category="---">---</option>
                              ${insertHTML}
                          <select>
                        </div>`;
      $('.shipping-page__box__category-select').append(childSelectHtml);
    }
    // 孫カテゴリーの表示作成
    function appendGrandchidrenBox(insertHTML){
      var grandchildSelectHtml = '';
      grandchildSelectHtml = `<div class='shipping-page__box__category-select--added2' id= 'grandchildren_wrapper'>
                              <i class='fas fa-chevron-down shipping-page__box__category-select--arrow-down2'></i>
                                <select class="shipping-page__box__category-select--box-select" id="grandchild_category" name="item[category_id]">
                                  <option value="---" data-category="---">---</option>
                                  ${insertHTML}
                                </select>
                              </div>`;
      $('.shipping-page__box__category-select').append(grandchildSelectHtml);
    }
    // 親カテゴリー選択後のイベント, '#parent_category'でイベントを起こす id の指定をしている。ここのidに該当する箇所が変更されるとイベントが発火する
    $(document).on('change',"#parent_category",function(){
      var parent_category_id = document.getElementById
      ('parent_category').value; 
      //選択された親カテゴリーの名前を取得
      if (parent_category_id != ""){ //親カテゴリーが初期値でないことを確認
        $.ajax({
          url: "/items/get_category_children",
          type: 'GET',
          data: { parent_id: parent_category_id },
          dataType: 'json'
        })
        .done(function(children){
          $('#children_wrapper'     ).remove(); //親が変更された時、子以下を削除する
          $('#grandchildren_wrapper').remove();//子が変更された時、孫以下を削除する
          var insertHTML = '';
          children.forEach(function(child){
            insertHTML += appendOption(child);
          });
          // forEachでそれぞれの各子供要素をひとつづつ取り出している。doneは通信成功時のコールバック処理。
          appendChidrenBox(insertHTML);
        })
        .fail(function(){                  // failは通信失敗時のコールバック処理
          alert('カテゴリー取得に失敗しました');
        })
      }else{
        $('#children_wrapper'     ).remove(); //親カテゴリーが初期値になった時、子以下を削除する
        $('#grandchildren_wrapper').remove(); //子カテゴリーが初期値になった時、孫以下を削除する
      }
    });
    // 子カテゴリー選択後のイベント
    $(document).on('change', '#child_category', function(){
      var child_category_id = $('#child_category option:selected').data('category'); //選択された子カテゴリーのidを取得
      if (child_category_id != "---"){ //子カテゴリーが初期値でないことを確認
        $.ajax({
          url: "/items/get_category_grandchildren",
          type: 'GET',
          data: { child_id: child_category_id },
          dataType: 'json'
        })
        .done(function(grandchildren){
          if (grandchildren.length != 0) {
            $('#grandchildren_wrapper').remove(); //子が変更された時、孫以下を削除する
            var insertHTML = '';
            grandchildren.forEach(function(grandchild){
              insertHTML += appendOption(grandchild);
            });
            appendGrandchidrenBox(insertHTML);
          }
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
      }else{
        $('#grandchildren_wrapper').remove(); //子カテゴリーが初期値になった時、孫以下を削除する
      }
    });
  });
});