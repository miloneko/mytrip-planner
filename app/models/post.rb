class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user

  validates :image, presence: true
  validates :title, presence: true, length: { maximum: 50 }
end
