## usersテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|nickname|string|null: false|
|mail|string|null: false, unique: true|
|pass|string|null: false, unique: true|
|confirmation_pass|string|null: false, unique: true|
|family_name|string|null: false|
|family_name_kana|string|null: false|
|first_name|string|null: false|
|first_name_kana|integer|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|null: false|
|icon|string|

#### アソシエーション
has_many :cards
has_many :shipping_infos
has_many :comments
has_many :items


## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|card_number|integer|null: false|
|expiration_date_month|integer|null: false|
|expiration_date_year|integer|null: false|
|security_code|integer|null: false|
|user|references|null: false, unique: true, foreign_key: true|
z1
#### アソシエーション
belongs_to :user


## shipping_infosテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|family_name|string|null: false|
|family_name_kana|string|null: false|
|first_name|string|null: false|
|first_name_kana|integer|null: false|
|postal_code|integer|
|prefectures|references|null: false, foreign_key: true|
|city||string|
|address||string|
|building||string|
|phone_number|integer|
|user|references|null: false, foreign_key: true|

#### アソシエーション
belongs_to :user


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|comment|text|
|user|references|foreign_key: true|
|item|references|foreign_key: true|

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
|prefectures|references|null: false, foreign_key: true|
|shipping_day|references|null: false, foreign_key: true|
|shipping_method|references|null: false, foreign_key: true|
|price|string|null: false|
|item_size|references|foreign_key: true|
|user|references|null: false, foreign_key: true|

#### アソシエーション
has_many : item_images
has_many : comments
belongs_to :categorys
belongs_to :brands
belongs_to :conditions
belongs_to :shipping_costs
belongs_to :prefectures
belongs_to :shipping_days
belongs_to :item_sizes
belongs_to :shipping_methods
belongs_to :user


## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|image|string|null: false|
|item|references|null: false, foreign_key: true|

#### アソシエーション
belongs_to :items


## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|name|string|null: false|

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

## prefecturesテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|prefectures|string|null: false|

#### アソシエーション
has_many : items
has_many : shipping_info