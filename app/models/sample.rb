class Sample < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :sample_categories, dependent: :destroy
  has_many :categories, through: :sample_categories
  belongs_to_active_hash :location

  validates :title, presence: true, length: { maximum: 50 }
end
