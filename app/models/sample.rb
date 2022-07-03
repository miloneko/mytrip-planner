class Sample < ApplicationRecord
  has_many :sample_categories, dependent: :destroy
  has_many :categories, through: :sample_categories

  validates :title, presence: true, length: { maximum: 50 }
end
