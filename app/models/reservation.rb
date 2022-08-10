class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :start_day, presence: true
  validates :finish_day, presence: true
  validates :people, presence: true
  validates :total_price, presence: true
end
