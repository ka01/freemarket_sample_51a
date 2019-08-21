class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :deliver_adress
  accepts_nested_attributes_for :deliver_adress

  VALID_EMAIL_REGEX =                 /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_KANA_REGEX  =                 /\A[ァ-ヶー－]+\z/

  validates :nickname,                presence: true, length: {maximum: 20}
  validates :email,                   presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password,                presence: true, length: {minimum: 6, maximum: 128},on: :save_to_session_before_phone
  validates :password_confirmation,   presence: true, length: {minimum: 6, maximum: 128},on: :save_to_session_before_phone
  validates :family_name,             presence: true
  validates :first_name,              presence: true
  validates :family_name_kana,        presence: true, format: { with: VALID_KANA_REGEX }
  validates :first_name_kana,         presence: true, format: { with: VALID_KANA_REGEX }
  validates :birth_year,              presence: true
  validates :birth_month,             presence: true
  validates :birth_day,               presence: true

end
