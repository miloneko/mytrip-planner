class Plan < ApplicationRecord
  belongs_to :user
  has_many :samples
  has_many :posts, dependent: :destroy

  scope :by_category, ->(category_id) { where(category_id: 3) }
  
end
