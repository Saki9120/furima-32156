class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  with_options presence: true do
    with_options format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
      validates :last_name
      validates :first_name
    end
    with_options format: { with: /\A[ァ-ン]+\z/ } do
      validates :last_kana
      validates :first_kana
    end
    validates :nickname
    validates :birthday
  end

  validates :email, uniqueness: { case_sensitive: false }
  validates :password, format: { with: /\A[a-z\d]\z/i }
  
  has_many :items
  has_many :purchases
        
end
