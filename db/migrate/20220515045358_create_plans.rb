class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.datetime :start_time
      t.datetime :end_time
      t.string :spot
      t.string :budget
      t.text :body

      t.timestamps
    end
  end
end
