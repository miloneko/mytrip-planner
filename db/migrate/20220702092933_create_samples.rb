class CreateSamples < ActiveRecord::Migration[6.1]
  def change
    create_table :samples do |t|
      t.string :image
      t.string :title, null: false
      t.integer :location_id
      t.string :address

      t.timestamps
    end
  end
end
