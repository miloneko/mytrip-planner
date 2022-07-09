class AddCategoryIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :category, foreign_key: true
  end
end
