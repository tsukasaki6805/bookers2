class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :user_profile, dependent: :destroy
  has_many :books, dependent: :destroy


  validates :name, uniqueness: true
  validates :name, length: {minimum: 2, maximum: 20}
  validates :introduction, length: {maximum:50}

  attachment :profile_image

end
