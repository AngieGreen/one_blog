class Category < ActiveRecord::Base
  validates :name, presence: true
  validates :week, presence: true, uniqueness: true
end
