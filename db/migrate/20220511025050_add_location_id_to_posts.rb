class AddLocationIdToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :location_id, :integer
  end
end
