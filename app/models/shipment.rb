class Shipment < ApplicationRecord
  
  belongs_to :buy

      # #郵便番号は必須かつ「3桁ハイフン4桁」の半角文字列のみ有効
      # validates :address, presence: true, format: { with:/\A\d[0-9]{3}-\d[0-9]{4}\z/ }

      # #地域の選択が「---」の時は保存できないようにする
      # validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"}

      # #市区町村が必須
      # validates :city, presence: true

      # #番地が必須
      # validates :street_num, presence: true

      # #電話番号が必須かつ10桁以上11桁以内の半角数値のみ有効
      # validates :phone, presence: true, numericality: { only_integer: true }, length: { minimum: 10, maximum: 11 }
end
