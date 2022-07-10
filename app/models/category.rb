class Category < ApplicationRecord
  has_many :post_categories, dependent: :destroy
  has_many :posts, through: :post_categories
  has_many :user_categories, dependent: :destroy
  has_many :users, through: :user_categories
end
