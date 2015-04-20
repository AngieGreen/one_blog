class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :comments, :dependent => :destroy
  default_scope -> { order(created_at: :desc) }
  mount_uploader :photo, PhotoUploader
  validates :content, presence: true
  validates :day, presence: true
  validates :title, presence: true
end
