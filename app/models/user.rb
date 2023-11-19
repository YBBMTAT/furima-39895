class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         
         validates :kanji_last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
         validates :kanji_first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
         validates :kana_last_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
         validates :kana_first_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
         validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
         validates :password, confirmation: { case_sensitive: true }

         validates :birthday, presence: true
end
