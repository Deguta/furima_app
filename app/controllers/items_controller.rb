class ItemsController < ApplicationController
  #before_action、『コントローラーの全てのアクションが実行される前に何らかの処理を行う時に使用するもの』
  before_action :set_item, only: [:show, :destroy, :edit, :update]

  def index
    @items = Item.includes(:item_images).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.item_images.new

    #セレクトボックスの初期値設定
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    #親カテゴリーのパスは値が "nil" なので、送る値がからであることをcategory.jp内の条件分岐でも気にしておく。
    # whereは、{ 与えられた条件にマッチするレコードをすべて返す }、nilはカテゴリーの一番上に記載しているもの。（最初の大枠）
    @category_parent_array = Category.where(ancestry: nil)
  end

  # 以下全て、formatはjsonのみ
  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find(params[:parent_id]).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    #ancestryを導入、".children"メソッドで、選択されたものの子カテゴリーの配列を取得する。(親："{params[child_id]}")
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  def show
  end

  def create 
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化、
    #親カテゴリーのパスは値が "nil" なので
    @category_parent_array = Category.where(ancestry: nil)
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

private

  def item_params
    params.require(:item).permit(:name, :category_id, :description, :category, :brand, :condition, :shipping_cost, :prefecture_id, :shipping_day, :price, item_images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
