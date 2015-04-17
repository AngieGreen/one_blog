class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :category_id, presence: true
  validates :content, presence: true
  validates :day, presence: true
  validates :title, presence: true
  self.per_page = 10
end
