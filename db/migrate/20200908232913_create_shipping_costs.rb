class CreateShippingCosts < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_costs do |t|

      t.integer  :cost,     null: false
      t.timestamps
    end
  end
end
