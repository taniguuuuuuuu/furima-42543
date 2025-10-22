class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アソシエーション
  has_many :items, dependent: :destroy

  # ニックネーム
  validates :nickname, presence: { message: "can't be blank" }

  # お名前(全角)
  validates :last_name,  presence: { message: "can't be blank" },
                         format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' }
  validates :first_name, presence: { message: "can't be blank" },
                         format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' }

  # お名前カナ(全角)
  validates :last_name_kana,  presence: { message: "can't be blank" },
                              format: { with: /\A[ァ-ヶー]+\z/, message: 'is invalid. Input full-width katakana characters' }
  validates :first_name_kana, presence: { message: "can't be blank" },
                              format: { with: /\A[ァ-ヶー]+\z/, message: 'is invalid. Input full-width katakana characters' }

  # 生年月日
  validates :birthday, presence: { message: "can't be blank" }

  # パスワード
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/,
                                 message: 'is invalid. Include both letters and numbers' }
  has_many :purchases
end
