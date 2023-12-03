class BuysController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @shipment_buy = ShipmentBuy.new
  end

  def create
    if @shipment_buy.valid?
      #Buysテーブルに保存
      buy = Buy.create(@shipment_buy.buy_params)
      #shipmentsテーブルに保存
      shipment = Shipment.create(@shipment_buy.shipment_params)
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

private

def buy_params
  params.require(:buy).permit(:item_id, :user_id)
end

def shipment_params
  params.require(:shipment).permit(:address, :prefecture_id, :city, :street_num, :building, :phone).merge(user_id: current_user.id)
end

end
