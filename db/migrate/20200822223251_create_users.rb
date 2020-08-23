class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string  :nickname,              null: false
      t.string  :mail,                  null: false, unique: true
      t.string  :pass,                  null: false, unique: true
      t.string  :confirmation_pass,     null: false, unique: true
      t.string  :family_name,           null: false
      t.string  :family_name_kana,      null: false
      t.string  :first_name,            null: false
      t.string  :first_name_kana,       null: false
      t.integer :birth_year,            null: false
      t.integer :birth_month,           null: false
      t.integer :birth_day,             null: false
      t.string  :icon
      t.timestamps
    end
  end
end