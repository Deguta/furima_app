class ItemsController < ApplicationController
  def index
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
  end

  def destroy
  end

end

private

def item_params
  params.require(:item).permit(:name, :description, :category, :brand, :condition, :shipping_cost, :prefecture_id, :shipping_day, :price, images_attributes: [:image]).merge(user_id: current_user.id)
end
