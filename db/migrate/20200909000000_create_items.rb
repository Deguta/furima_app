class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string     :name,             null: false
      t.text       :description,      null: false
      t.string     :category_id,      null: false
      t.string     :brand
      t.string     :condition,        null: false
      t.string     :shipping_cost,    null: false
      t.integer    :prefecture_id,    null: false
      t.string     :shipping_day,     null: false
      t.string     :shipping_method
      t.string     :price,            null: false
      t.string     :item_size
      t.references :user,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
