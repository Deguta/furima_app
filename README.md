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
belongs_to :buyer


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
|city|string|null: false|
|address|string|null: false|
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
|category|string|null: false|
|brand|string|
|condition|string|null: false|
|shipping_cost|string|null: false|
|prefecture|string|null: false|
|shipping_day|string|null: false|
|shipping_method|string|
|price|string|null: false|
|item_size|string|
|user|references|null: false, foreign_key: true|

#### アソシエーション
has_many : item_images, dependent::destroy
has_many : comments, dependent::destroy
belongs_to_active_hash :prefecture
belongs_to :user
belongs_to :buyer


## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|image|string|null: false|
|item|references|null: false, foreign_key: true|

#### アソシエーション
belongs_to :item


## buyersテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|

#### アソシエーション
has_one : user
has_one : item


## ER図
https://gyazo.com/0c0ee05bf96a1d599aa7c99923247a20