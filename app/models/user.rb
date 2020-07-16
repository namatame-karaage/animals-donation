class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image

  has_many :animals, dependent: :destroy
  belongs_to :user
  has_many :favorites, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def already_favorited?(animal)
    self.favorites.exists?(animal_id: animal.id)
  end
end


