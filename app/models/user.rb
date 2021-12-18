class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :user_profile, dependent: :destroy
  has_many :books, dependent: :destroy


  validates :name, uniqueness: true
  validates :name, presence: true
  validates :name, length: { in: 2..20}
  validates :introduction, length: { maximum:50 }

  def email_required?
    false
  end

  def email_changed
    false
  end

end
