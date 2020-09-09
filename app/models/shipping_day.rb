class ShippingDay < ApplicationRecord

    # アソシエーション
    has_many :items

    # バリデーション
    validates :day,       presence: true
end
