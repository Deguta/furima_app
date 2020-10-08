class ItemsController < ApplicationController
before_action :set_item, except: [:index, :new, :create]

  def index
    @items = Item.includes(:item_images).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.item_images.new
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
    Payjp.api_key = "sk_test_9796bba6da01aba335a8b770"
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
  params.require(:item).permit(:name, :description, :category, :brand, :condition, :shipping_cost, :prefecture_id, :shipping_day, :price, item_images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
end

  def set_item
    @item = Item.find(params[:id])
  end
end