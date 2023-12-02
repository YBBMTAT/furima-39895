class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :show]
  before_action :move_to_new_user_session, except: [:index,:show]

  def index
    @items = Item.all.order("created_at DESC")
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

  def show

  end

  def edit
     unless current_user == @item.user
      redirect_to root_path
     end
  end

  def update

    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :price, :description, :category_id, :condition_id, :postage_id, :prefecture_id, :leadtime_id,).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_new_user_session
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
