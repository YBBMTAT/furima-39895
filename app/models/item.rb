class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :condition
    belongs_to :leadtime
    belongs_to :postage
    belongs_to :prefecture
    has_one :purchase
    #↑プルダウンデータ
    belongs_to :user
    has_one_attached :image
    #カテゴリーの選択が「---」の時は保存できないようにする
    validates :category_id, numericality: { other_than: 1, message: "can't be blank"}

    #状態の選択が「---」の時は保存できないようにする
    validates :condition_id, numericality: { other_than: 1, message: "can't be blank"}

    #発送日の選択が「---」の時は保存できないようにする
    validates :leadtime_id, numericality: { other_than: 1, message: "can't be blank"}

    #送料の選択が「---」の時は保存できないようにする
    validates :postage_id, numericality: { other_than: 1, message: "can't be blank"}

    #地域の選択が「---」の時は保存できないようにする
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"}

    validates :image, presence: true
    validates :item_name, presence: true, length: { maximum: 40 }
    validates :description, presence: true, length: { maximum: 1000 }
    validates :price, presence: true
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

end
