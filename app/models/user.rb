class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook google_oauth2]
  has_many :social_profiles, dependent: :destroy
  has_many :items, through: :purchases
  has_many :purchases


  has_one :deliver_adress
  accepts_nested_attributes_for :deliver_adress
  has_one :identification

  VALID_EMAIL_REGEX =                 /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_KANA_REGEX  =                 /\A[ァ-ヶー－]+\z/

  validates :nickname,                presence: true, length: {maximum: 20}
  validates :email,                   presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password,                presence: true, length: {minimum: 6, maximum: 128},on: :save_to_session_before_phone
  validates :password_confirmation,   presence: true, confirmation: true, on: :create
  validates :family_name,             presence: true
  validates :first_name,              presence: true
  validates :family_name_kana,        presence: true, format: { with: VALID_KANA_REGEX }
  validates :first_name_kana,         presence: true, format: { with: VALID_KANA_REGEX }
  validates :birth_year,              presence: true
  validates :birth_month,             presence: true
  validates :birth_day,               presence: true

  def self.find_omniauth(auth)
    # SNSのuidとproviderを変数に代入
    uid = auth.uid
    provider = auth.provider
    # DBにすでにSNS情報を保存しているユーザーを検索し、snsに代入
    sns_register = SocialProfile.where(uid: uid, provider: provider).first
    if sns_register.present? #(パターン①)SocialProfileのDBに存在していれば登録ユーザーを返す
      user = User.where(id: sns_register.user_id).first
    else  #SocialProfileのDBに存在してない、SocialProfileにあるemailと同一のemailアドレスを持つユーザーを探す
      user_register = User.where(email: auth.info.email).first
      if user_register.present? #(パターン②)userがみつかったらSocialProfileのDBにレコード作成
        user = user_register
        SocialProfile.create(
              uid: uid,
              provider: provider,
              user_id: user.id
              )
      else #(パターン③)user見つからなければ
        user = User.new(
            nickname: auth.info.name,
            email: auth.info.email,
            )
      end
    end
    return user  #返り値はuser(3パターン)
  end
end
