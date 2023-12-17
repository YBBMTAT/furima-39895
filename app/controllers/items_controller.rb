class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :show]
  before_action :move_to_new_user_session, except: [:index,:show]
  before_action :edit_move_to_top_session, except: [:index,:show,:new,:destroy]
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
    if user_signed_in? && current_user != @item.user && Buy.exists?(item_id: @item.id)
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
      item = Item.find(params[:id])
    if current_user == item.user
      item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :price, :description, :category_id, :condition_id, :postage_id, :prefecture_id, :leadtime_id,).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def edit_move_to_top_session
    unless current_user == @item.user && !Buy.exists?(item_id: @item.id)
     redirect_to root_path
    end
  end


  def move_to_new_user_session
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
