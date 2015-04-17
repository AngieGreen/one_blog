class Category < ActiveRecord::Base
  has_many :posts
  validates :name, presence: true
  validates :week, presence: true, uniqueness: true
end
