class Room < ApplicationRecord
  has_one :reservation
  belongs_to :user
  mount_uploader :image, RoomImageUploader
  validates :name, presence: true
  validates :intro, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :image, presence: true
end
