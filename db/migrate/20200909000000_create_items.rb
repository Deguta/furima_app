class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string     :name,             null: false
      t.text       :description,      null: false
      t.string     :price,            null: false
      
      t.references :user,             null: false, foreign_key: true
      t.references :category,         null: false, foreign_key: true
      t.references :brand,            foreign_key: true
      t.references :condition,        null: false, foreign_key: true
      t.references :shipping_cost,    null: false, foreign_key: true
      t.integer    :prefecture_id,    null: false
      t.references :shipping_day,     null: false, foreign_key: true
      t.references :item_size,        foreign_key: true
      t.references :shipping_method,  foreign_key: true
      t.timestamps
    end
  end
end
