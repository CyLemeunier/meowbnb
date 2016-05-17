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
end
