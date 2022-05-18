class AddAddressToPlans < ActiveRecord::Migration[6.1]
  def change
    add_column :plans, :address, :string
  end
end
