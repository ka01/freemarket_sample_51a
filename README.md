# DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|password|string|null: false|
|email|string|null: false, unique: true|
### Association
- has_many :likes
- has_many :comments
- has many :messages
- has many :points
- has_many :social_providers
- has_one :deliver_adresses
- has_one :user_detail
- has_many :wallets
- has_many :points
- has many :reviews

## social_providersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, FK: true|
|provider|string|null :false|
### Association
- belongs_to :user

## deliver_adressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, FK: true|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|zip_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|adress1|string|null: false|
|adress2|string|
|telephone|integer|unique: true|
### Association
- belongs_to :user

## user_detailテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, FK: true|
|nickname|string|null: false|
|introduction|text|
### Association
- belongs_to :user

## walletsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, FK: true|
|money|integer|null: false|
### Association
- belongs_to :user

## pointsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, FK: true|
|score|integer|null: false|
### Association
- belongs_to :user

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, FK: true|
|item_id|references|null: false, FK: true|
|text|text|null: false|
### Association
belongs_to :user
belongs_to :item

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, FK: true|
|item_id|references|null: false, FK: true|
|text|text|null: false|
### Association
- belongs_to :user
- belongs_to :item

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null:false, FK: true|
|item_id|references|null:false, FK: true|
### Association
- belongs_to :user
- belongs_to :item

## reviewsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, FK: true|
|item_id|references|null: false, FK:true|
|rate|integer|null: false|
|text|text|
### Association
- belongs_to :item
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|category_id|references|null: false, FK: true|
|shipping_id|references|null: false. FK: true|
|brand_id|references|null: false. FK: true|
|seller_user_id|references|null: false, FK: true|
|buyer_user_id|references|FK: true|
|name|string|null: false|
|text|text|null: false|
|condition|integer|null: false|
|price|integer|null: false|
|trading_status|integer|null: false|
|completed_at|datetime|
### Association
- belongs_to :categories
- belongs_to :brands
- has_many :likes
- has_many :comments
- has_many :messages
- has_one :shipping
- has_many :reviews
- has_many :item_images

## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, FK: true|
|image_url|string|null: false|
### Association
- belongs_to :item

## categoriesテーブル（経路列挙モデル）
|Column|type|Option|
|------|----|-------|
|path|text|null: false|
|name|string|null: false|
### Association
- has_many :brands

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|category_id|references|null: false, FK: true|
|name|string|null: false|
### Association
- has_many :item
- has_many :brands_brand_groups

## brands_brand_groupsテーブル
|Column|Type|Options|
|------|----|-------|
|brand_id|references|null: false, FK: true|
|brand_group_id|references|null: false, FK: true|
### Association
- belongs_to :brand
- belongs_to :brand-groups

## brand-groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
## Association
- has_many :brands_brand-groups

## shippingsテーブル
|Column|Type|Options|
|------|----|-------|
|fee_burden|boolian|null: false|
|method|integer|null: false|
|area|integer|null: false|
|shipping_period|integer|null: false|
### Association
- belongs_to :item

### cards(クレジットカード)
**pay.jpで実装するので不要**