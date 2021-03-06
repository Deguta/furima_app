class ItemImage < ApplicationRecord

    # アソシエーション
    mount_uploader :image, ImageUploader
    belongs_to     :item
    
    validates      :image, presence: true
end
