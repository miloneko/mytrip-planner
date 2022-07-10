class CreateSampleCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :sample_categories do |t|
      t.references :sample, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
