
# CATEGORIES = ["Cuddles", "Watchcat", "Luxury", "Wingman Cat"]
# RACES = ["British Shorthair", "Maine Coone", "Sphynx", "Persian", "Siamese", "Street Cat"]

class Cat < ActiveRecord::Base
  belongs_to :user
  has_many :reservations
  validates :name, presence: true
  validates :user, presence: true
  validates :category, presence: true
  validates :race, presence: true
  validates :year_of_birth, presence: true
  validates :description, presence: true
  validates :price_per_day, presence: true

  mount_uploader :photo, PhotoUploader
end

# inclusion: { in: CATEGORIES }
# inclusion: { in: RACES }
