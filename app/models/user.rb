class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reservations
  has_many :rooms
  mount_uploader :image, UserImageUploader
  validates :image, presence: true , on: :update
  validates :intro, presence: true, on: :update
  validates :name, presence: true, on: :update
end
