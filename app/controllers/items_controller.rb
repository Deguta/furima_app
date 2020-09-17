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
  params.require(:item).permit(:name, :description, :price, :category_id, :brand_id, :condition_id, :shipping_cost_id, :prefecture_id, :shipping_day_id, images_attributes: [:image])
end
