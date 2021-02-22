class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
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

  validates :birthday, presence: true
end
