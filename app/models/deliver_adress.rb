class DeliverAdress < ApplicationRecord
  belongs_to :user, optional: true

  VALID_KANA_REGEX  =                 /\A[ァ-ヶー－]+\z/

  validates :family_name,             presence: true
  validates :first_name,              presence: true
  validates :family_name_kana,        presence: true, format: { with: VALID_KANA_REGEX }
  validates :first_name_kana,         presence: true, format: { with: VALID_KANA_REGEX }
  validates :zip_code,                presence: true
  validates :prefecture,              presence: true
  validates :city,                    presence: true
  validates :adress1,                 presence: true
  validates :telephone,               uniqueness: true, allow_blank: true
end
