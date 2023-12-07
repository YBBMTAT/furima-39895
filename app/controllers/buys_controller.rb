class BuysController < ApplicationController

  def index
   
    @item = Item.find(params[:item_id])
    @shipment_buy = ShipmentBuy.new
  end

  def create
    @item = Item.find(params[:item_id])
    @shipment_buy = ShipmentBuy.new(buy_params)
    if @shipment_buy.valid?
      @shipment_buy.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def buy_params
    params.require(:shipment_buy).permit(:address, :prefecture_id, :city, :street_num, :building, :phone, :user_id, :item_id).merge(user_id: current_user.id)
  end

end
