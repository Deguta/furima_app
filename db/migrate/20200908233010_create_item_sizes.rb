class CreateItemSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :item_sizes do |t|

      t.string   :size
      t.timestamps
    end
  end
end
