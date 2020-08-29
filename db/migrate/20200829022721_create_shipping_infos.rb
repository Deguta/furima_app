class CreateShippingInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_infos do |t|
      t.string     :family_name,        null: false
      t.string     :family_name_kana,   null: false
      t.string     :first_name,         null: false
      t.string     :first_name_kana,    null: false
      t.integer    :postal_code
      t.integer    :prefecture,         null: false
      t.string     :city
      t.string     :address
      t.string     :building
      t.integer    :phone_number

      t.references :user,               null: false, foreign_key: true
      t.timestamps
    end
  end
end
