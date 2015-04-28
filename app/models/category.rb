class Category < ActiveRecord::Base
  has_many :posts
  has_many :photos
  validates :name, presence: true
  validates :week, presence: true, uniqueness: true

  #carrier wave
  mount_uploader :image, PhotoUploader
end
