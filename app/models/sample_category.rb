class SampleCategory < ApplicationRecord
  belongs_to :sample
  belongs_to :category

  accepts_nested_attributes_for :category
end
