class AddPostIdToPlans < ActiveRecord::Migration[6.1]
  def change
    add_reference :plans, :post, foreign_key: true
  end
end
