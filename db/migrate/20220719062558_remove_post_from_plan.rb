class RemovePostFromPlan < ActiveRecord::Migration[6.1]
  def change
    remove_reference :plans, :post, null: false, foreign_key: true
  end
end
