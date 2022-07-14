class Plan < ApplicationRecord
  belongs_to :user
  has_many :samples
  has_many :posts, dependent: :destroy

end
