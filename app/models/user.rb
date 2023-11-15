class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         #validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
         validates :email, format: { with: /.*\.jp\z/i }
         validates :password, presence: true
         validates :password, confirmation: { case_sensitive: true }
         validates :password_confirmation, presence: true
end
