class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  # has_many :likes dependent: :destroy
  # has_many :comments dependent: :destroy
  # has many :messages dependent: :destroy
  # has many :points dependent: :destroy
  # has_many :social_providers dependent: :destroy
  # has_one :deliver_adresses dependent: :destroy
  # has_one :user_detail dependent: :destroy
  # has_many :wallets dependent: :destroy
  # has_many :points dependent: :destroy
  # has many :reviews dependent: :destroy
  # has_many :orders dependent: :destroy
end
