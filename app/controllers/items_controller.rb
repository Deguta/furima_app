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

  # クレジットカードによる購入アクション
  def purchase
    @shipping_info = ShippingInfo.where(user_id: current_user.id)
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to new_card_path, notice: "クレジットカード情報を入力してください"
    else
      Payjp.api_key = "sk_test_9796bba6da01aba335a8b770"
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay #支払いを完了させるアクション
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV["PAYJP_PUBLIC_KEY"]
    Payjp::Charge.create(
      amount: @item.price, #支払金額を入力
      customer: card.customer_id, #顧客ID
      currency: 'jpy', #日本円
    )

    @item.user_id = current_user.id
    @item.save
    Buyer.create(user_id: current_user.id, item_id: @item.id)
    flash[:alert] = "支払いが完了しました"
    redirect_to root_path
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
