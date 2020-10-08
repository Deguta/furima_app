class Category < ApplicationRecord
  has_many :items
  has_ancestry #この記述を追加することで階層化できる

end