class UserSample < ApplicationRecord
  has_many :users
  has_many :samples
end
