class ItemImage < ApplicationRecord

    # アソシエーション
    mount_uploader :image, ImageUploader
    belongs_to :item

    # バリデーション
    validates  :image,       presence: true
end
