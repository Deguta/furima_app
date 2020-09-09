class ItemImage < ApplicationRecord

    # アソシエーション
    belongs_to :item

    # バリデーション
    validates  :image,       presence: true
end
