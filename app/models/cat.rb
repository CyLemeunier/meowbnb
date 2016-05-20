
CATEGORIES = ["Mice Exterminator", "Cuddly", "Watchcat", "Luxury", "Wingman Cat", "Celebrity", "Corporate Events", "Drug Detection"]
RACES = ["British Shorthair", "Maine Coon", "Sphynx", "Persian", "Siamese", "Street Cat"]

class Cat < ActiveRecord::Base
  belongs_to :user
  has_many :reservations
  validates :name, presence: true
  validates :user, presence: true
  validates :category, presence: true
  validates :race, presence: true
  validates :year_of_birth, presence: true
  validates :description, presence: true
  validates :intro, presence: true, length: {
    minimum: 10,
    maximum: 50,
    too_short: "must have at least %{10} characters",
    too_long: "can't have more than %{30} characters" }
  validates :price_per_day, presence: true

  mount_uploader :photo, PhotoUploader
end

# inclusion: { in: CATEGORIES }
# inclusion: { in: RACES }
