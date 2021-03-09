class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_many :products
  has_many :sns_credentials

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: 'カタカナでお願いします' } do
    validates :first_name_kana
    validates :last_name_kana
  end

  with_options format: { with: /\A(.?*?[a-z])(?=.*?\d)[a-z\d]+\z/i } do
    validates :password
  end

  with_options presence: true do
    validates :birthday
    validates :nickname
  end
end
