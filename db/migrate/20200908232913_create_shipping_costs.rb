class CreateShippingCosts < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_costs do |t|

      t.timestamps
    end
  end
end