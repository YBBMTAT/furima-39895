class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "は6文字以上の半角英数字で入力してください。"}
         validates :nickname, presence: true
         validates :kanji_last_name, presence: true, format: { with:/\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角漢字平仮名で入力してください。"}
         validates :kanji_first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角漢字平仮名で入力してください。"}
         validates :kana_last_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力してください。" }
         validates :kana_first_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力してください。"}
         validates :birthday, presence: true

         has_many :items
         has_many :buys
end
