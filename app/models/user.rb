class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :kanji_last_name, presence: true, format: { with:/\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
         validates :kanji_first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
         validates :kana_last_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
         validates :kana_first_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
         validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
         validates :birthday, presence: true

         has_many :items
         has_many :buys
end
