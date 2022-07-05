class Sample < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :sample_categories, dependent: :destroy
  has_many :categories, through: :sample_categories
  belongs_to_active_hash :location
  has_many :users, through: :user_samples
  has_many :user_samples
  accepts_nested_attributes_for :user_samples

  validates :title, presence: true, length: { maximum: 50 }
end
