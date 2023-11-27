class ItemsController < ApplicationController
  before_action :move_to_new_user_session, except: [:index]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
   @item = Item.new(item_params)
   if @item.save
    redirect_to root_path
   else
    render :new, status: :unprocessable_entity
   end
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :price, :description, :category_id, :condition_id, :postage_id, :prefecture_id, :leadtime_id,).merge(user_id: current_user.id)
  end

  def move_to_new_user_session
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
