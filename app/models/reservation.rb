class Reservation < ActiveRecord::Base
  belongs_to :cat
  belongs_to :user
  validates :start_date, presence: true
  validates :end_date, presence: true
  # validates :price, presence: true
  # validates :cat, presence: true
  # validates :user, presence: true
end
