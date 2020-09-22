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
    if @item.save!
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
      flash.now[:alert] = '画像を１枚以上添付してください'
      render :edit
    end
  end

  def destroy
  end

end

private

def item_params
  params.require(:item).permit(:name, :description, :category, :brand, :condition, :shipping_cost, :prefecture_id, :shipping_day, :price, item_images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
end

def set_item
  @item = Item.find(params[:id])
end