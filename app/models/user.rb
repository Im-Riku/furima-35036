class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  with_options presence: true do
    validates :nickname
    validates :last_name_kanji, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]/}
    validates :first_name_kanji, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]/}
    validates :last_name_katakana, format: { with: /\A[ァ-ヶー-]+\z/}
    validates :first_name_katakana, format: { with: /\A[ァ-ヶー-]+\z/}
    validates :birthday
  end

  
end
