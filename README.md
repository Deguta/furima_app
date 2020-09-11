## usersテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|nickname|string|null: false|
|mail|string|null: false, unique: true|
|pass|string|null: false|
|confirmation_pass|string|null: false|
|family_name|string|null: false|
|family_name_kana|string|null: false|
|first_name|string|null: false|
|first_name_kana|integer|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|null: false|
|icon|string|

#### アソシエーション
has_many :cards, dependent::destroy
has_many :shipping_infos, dependent::destroy
has_many :comments, dependent::destroy
has_many :items


## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|customer_id|string|null: false|
|card_id|string|null: false|
|user|references|null: false, unique: true, foreign_key: true|

#### アソシエーション
belongs_to :user


## shipping_infosテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|family_name|string|null: false|
|family_name_kana|string|null: false|
|first_name|string|null: false|
|first_name_kana|string|null: false|
|postal_code|integer|
|prefecture|string|null: false|
|city|string|
|address|string|
|building|string|
|phone_number|integer|
|user|references|null: false, foreign_key: true|

#### アソシエーション
belongs_to :user
belongs_to_active_hash :prefecture


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|comment|text|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|

#### アソシエーション
belongs_to :user
belongs_to :item


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|name|string|null: false|
|description|text|null: false|
|category|references|null: false, foreign_key: true|
|brand|references|foreign_key: true|
|condition|references|null: false, foreign_key: true|
|shipping_cost|references|null: false, foreign_key: true|
|prefecture|string|null: false|
|shipping_day|references|null: false, foreign_key: true|
|shipping_method|references|null: false, foreign_key: true|
|price|string|null: false|
|item_size|references|foreign_key: true|
|user|references|null: false, foreign_key: true|

#### アソシエーション
has_many : item_images, dependent::destroy
has_many : comments, dependent::destroy
belongs_to :category
belongs_to :brand
belongs_to :condition
belongs_to :shipping_cost
belongs_to_active_hash :prefecture
belongs_to :shipping_day
belongs_to :item_size
belongs_to :shipping_method
belongs_to :user


## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|image|string|null: false|
|item|references|null: false, foreign_key: true|

#### アソシエーション
belongs_to :item


## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|name|string|null: false|
|ancestry|string|

#### アソシエーション
has_many : items


## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|name|string|null: false|

#### アソシエーション
has_many : items


## conditionsテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|condition|string|null: false|

#### アソシエーション
has_many : items


## shipping_costsテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|cost|integer|null: false|

#### アソシエーション
has_many : items


## shipping_daysテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|day|string|null: false|

#### アソシエーション
has_many : items


## item_sizesテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|size|string|null: false|

#### アソシエーション
has_many : items


## shipping_methodsテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|method|string|null: false|

#### アソシエーション
has_many : items

## buyersテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|

#### アソシエーション
has_one : user
has_one : item


## ER図
https://gyazo.com/2a344c9b32bae7da8cbd19e9f5566c08