## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|first_name_zenkaku|string|null: false|
|last_name_zenkaku|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birthday|string|null: false|
|email|string|null: false, unique: true|
|encrypted_password|string|null: false|

### Association
- has_many :items
- has_many :likes
- has_many :comments
- has_one : address

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|status|string|null: false|
|body|text|null: false|
|deliver_fee|string|null: false|
|delivery_date|string|null: false|
|how_to_deliver|string|null: false|
|region|string|null: false|
|price|string|null: false|
|user_id|references|foreign_key: true|
|category_id|references|foreign_key: true|
|brand_id|references|foreign_key: true|
|include_image|string|null: false|

### Association
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- has_many :images
- has_many :comments
- has_many :likes

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many: categories
- has_many: items

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|
|body|string|null: false|

### Association
- belongs_to :user
- belongs_to :item

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|foreign_key: true|
|image|text|null: false|

### Association
- belongs_to: item

## addressテーブル
|column|Type|Option|
|----------|------|---------|
|user_id|references|foreign_key: true|
|build_name|string|
|address_banchi|string|null: false|
|post_number|integer|null: false|
|phone_number|string|
|prefectures|string|null: false|
|city|string|null: false|

### Association
- belongs_to: user

## Likesテーブル
|column|Type|Option|
|----------|------|---------|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|

### Association
- belongs_to: user
- belongs_to: item