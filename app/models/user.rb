class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :infomations, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorites_infomations, through: :favorites, source: :infomation
  
  def already_favorited?(infomation)
    self.favorites.exists?(infomation_id: infomation.id)
  end
end
