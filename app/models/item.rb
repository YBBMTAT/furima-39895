class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user

    #ジャンルの選択が「---」の時は保存できないようにする
    validates :genre_id, numericality: { other_than: 1 , message: "can't be blank"} 
end
