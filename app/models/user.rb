class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :posts, dependent: :destroy
  has_many :plans, dependent: :destroy
  has_many :authentications, dependent: :destroy
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :authentications
  has_many :likes, dependent: :destroy
  has_many :like_posts, through: :likes, source: :post 

  validates :password, length: { minimum: 6 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :reset_password_token, uniqueness: true, allow_nil: true

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true, length: { minimum: 2, maximum: 10 }
  validates :user_id, uniqueness: { scope: :post_id }

  mount_uploader :avatar, AvatarUploader

  enum role: { general: 0, admin: 1 }


  def own?(object)
    id == object.user_id
  end

  def like(post)
    like_posts << post
  end

  def unlike(post)
    like_posts.destroy(post)
  end

  def like?(post)
    like_posts.include?(post)
  end
end
