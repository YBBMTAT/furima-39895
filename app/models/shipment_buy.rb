class ShipmentBuy

  include ActiveModel::Model


  # フォームで使用(保存)する属性
  attr_accessor :address, :prefecture_id, :city, :street_num, :building, :phone, :user_id, :item_id, :item_price, :token

      with_options presence: true do
       # バリデーションの設定
        #郵便番号は必須かつ「3桁ハイフン4桁」の半角文字列のみ有効
        validates :address, format: { with: /\A\d{3}-\d{4}\z/ }

        #市区町村が必須
        validates :city

        #番地が必須
        validates :street_num

        #電話番号が必須かつ10桁以上11桁以内の半角数値のみ有効
        validates :phone, numericality: { only_integer: true }, length: { minimum: 10, maximum: 11 }

      
        #トークンが空では保存出来ない
        validates :token

        validates :user_id
        validates :item_id
      end

       #地域の選択が「---」の時は保存できないようにする
       validates :prefecture_id, numericality: { other_than: 1, message: "を選択してください"}

      def save
        #購入情報保存し変数buyに保存
        buy = Buy.create(user_id: user_id, item_id: item_id)
        #発送先を保存
        #buyには変数buyのidと指定
        Shipment.create(address: address, prefecture_id: prefecture_id, city: city, street_num: street_num, building: building, phone: phone, buy: buy)
      end
end