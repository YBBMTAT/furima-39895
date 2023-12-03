class ShipmentBuy
  
  include ActiveModel::Model


  # フォームで使用する属性
  attr_accessor :image, :item_name, :price, :postage_id, :address, :prefecture_id, :city, :street_num, :building, :phone

    # バリデーションの設定

end