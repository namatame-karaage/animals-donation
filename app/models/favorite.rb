class Favorite < ApplicationRecord
  belongs_to :user
  belogns_to :animal

  validates_uniqueness_of :animal_id ,scope: :user_id
end
