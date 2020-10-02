class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      # カテゴリー名を保存するカラムなので文字列型（string）を指定しNOTNULL制約も追加
      t.string :ancestry
      t.string :name, null: false
      t.timestamps
    end
  end
end
