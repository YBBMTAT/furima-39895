class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :leadtime
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :user

    #カテゴリーの選択が「---」の時は保存できないようにする
    validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}

    #状態の選択が「---」の時は保存できないようにする
    validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}

    #発送日の選択が「---」の時は保存できないようにする
    validates :leadtime_id, numericality: { other_than: 1 , message: "can't be blank"}

    #送料の選択が「---」の時は保存できないようにする
    validates :postage_id, numericality: { other_than: 1 , message: "can't be blank"}

    #地域の選択が「---」の時は保存できないようにする
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
end
