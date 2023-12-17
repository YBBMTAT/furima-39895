class BuysController < ApplicationController
  before_action :set_item, only:[:index, :create]

  before_action :authenticate_user!
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]


    if user_signed_in? && current_user != @item.user && !Buy.exists?(item_id: @item.id)
      @shipment_buy = ShipmentBuy.new
    else
      redirect_to root_path
    end

  end

  def create

    item_price = @item.price
    @shipment_buy = ShipmentBuy.new(buy_params.merge(item_price: item_price))
    if @shipment_buy.valid?
      pay_item(item_price)
      @shipment_buy.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"] #PAY.JPテスト公開密鍵
      render :index, status: :unprocessable_entity
    end
  end

  private

  def pay_item(item_price)
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] #PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: item_price, #商品の価格
      card: buy_params[:token], #カードトークン
      currency: 'jpy' #通貨単位
    )
  end

  def buy_params
    params.require(:shipment_buy).permit(:address, :prefecture_id, :city, :street_num, :building, :phone).merge(user_id: current_user.id, token: params[:token], item_id: params[:shipment_buy][:item_id])
  end


  def set_item
    @item = Item.find(params[:item_id])
  end

end
