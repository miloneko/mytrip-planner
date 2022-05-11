class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to_active_hash :location

  validates :image, presence: true
  validates :title, presence: true, length: { maximum: 50 }
end
