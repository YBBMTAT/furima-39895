class ItemsController < ApplicationController

  def index
    @items = Item.new
  end

  def new
    @item = Item.new
  end

  def create
   @item = Item.create(item_params)
   redirect_to '/'
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :price, :description, :category_id, :condition_id, :postage_id, :prefecture_id, :leadtime_id,).merge(user_id: current_user.id)
  end

end
