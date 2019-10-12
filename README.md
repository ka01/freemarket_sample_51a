# DB設計

## usersテーブル

| Column           | Type     | Options                   |
| ---------------- | -------- | ------------------------- |
| nickname         | string   | null: false               |
| introduction     | string   | null: false               |
| family_name      | string   | null: false               |
| first_name       | string   | null: false               |
| family_name_kana | string   | null: false               |
| first_name_kana  | string   | null: false               |
| birth_year       | integer  | null: false               |
| birth_month      | integer  | null: false               |
| birth_day        | integer  | null: false               |
| password         | string   | null: false               |
| email            | string   | null: false, unique: true |
| status           | integer  | null: false               |
| deleted_at       | datetime | null :false               |

Association

- has_many :social_profiles, dependent: :destroy
- has_many :items, through: :purchases
- has_many :purchases
- has_many :likes, dependent: :destroy

- has_one :deliver_adress
- accepts_nested_attributes_for :deliver_adress
- has_one :identification

***

## identificationテーブル

| Column   | Type       | Options               |
| -------- | ---------- | --------------------- |
| user_id          | references | null: false, FK: true |
| city             | string     | null: false           |
| adress1          | string     | null: false           |
| adress2          | string     |                       |
| post_code        | string     | null: false           |
| prefecture_code  | string     | null: false           |

Association

- belongs_to :user

***

## social_profilesテーブル

| Column   | Type       | Options               |
| -------- | ---------- | --------------------- |
| user_id  | references | null: false, FK: true |
| provider | string     | null :false           |
| uid      | string     | null :false           |

Association

- belongs_to :user

## deliver_adressesテーブル

| Column           | Type       | Options               |
| ---------------- | ---------- | --------------------- |
| user_id          | references | null: false, FK: true |
| family_name      | string     | null: false           |
| first_name       | string     | null: false           |
| family_name_kana | string     | null: false           |
| first_name_kana  | string     | null: false           |
| post_code        | string     | null: false           |
| prefecture_code  | string     | null: false           |
| city             | string     | null: false           |
| adress1          | string     | null: false           |
| adress2          | string     |                       |
| telephone        | string     | unique: true          |

Association

- belongs_to :user, optional: true

***


## likesテーブル

| Column  | Type       | Options              |
| ------- | ---------- | -------------------- |
| user_id | references | null:false, FK: true |
| item_id | references | null:false, FK: true |

Association

- belongs_to :user
- belongs_to :item

***

## purchasesテーブル

| Column        | Type       | Options               |
| ------------- | ---------- | --------------------- |
| buyer_id      | references | null: false, FK: true |
| seller_id     | references | null: false, FK: true |
| item_id       | references | null: false, FK: true |

Association

- belongs_to :item
- belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'
- belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'

***

## itemsテーブル

| Column         | Type       | Options               |
| -------------- | ---------- | --------------------- |
| size   e_id    | references | FK: true |
| category_id    | references | null: false, FK: true |
| shipping_id    | references | null: false. FK: true |
| brand_id       | references | FK: true |
| seller_id      | references | null: false, FK: true |
| buyer_id       | references | FK: true |
| name           | string     | null: false           |
| text           | text       | null: false           |
| condition      | integer    | null: false           |
| price          | integer    | null: false           |
| trading_status | integer    | null: false           |

Association

- has_many :users, through: :purchases
- belongs_to :category
- belongs_to :brand
- has_many :purchases
- belongs_to :brand, optional: true
- has_many :likes, dependent: :destroy
- has_one :shipping, dependent: :destroy
- accepts_nested_attributes_for :shipping
- belongs_to :size, optional: true
- has_many :item_images, dependent: :destroy
- accepts_nested_attributes_for :item_images, allow_destroy: true

***

## item_imagesテーブル

| Column    | Type       | Options               |
| --------- | ---------- | --------------------- |
| item_id   | references | null: false, FK: true |
| image_url | string     | null: false           |
| user_id      | references | null: false, FK: true |

Association

- belongs_to :item, optional: true

***

## categoriesテーブル（経路列挙モデル）

| Column | type   | Option      |
| ------ | ------ | ----------- |
| path   | text   | null: false |
| name   | string | null: false |
| ancestry | string |             |

Association

- has_many :brands
- has_many :items
- has_one :category_size
- has_one :size, through: :category_size
- has_one :category_brand_group
- has_one :brand_group, through: :category_brand_group
- has_ancestry

***

## sizesテーブル（経路列挙モデル）

| Column | type   | Option      |
| ------ | ------ | ----------- |
| path   | text   | null: false |
| kind   | string | null: false |
| ancestry | string |             |

Association

- has_many :items
- has_many :category_sizes
- has_many :categories, through: :category_sizes
- has_ancestry

***

## category_sizesテーブル

| Column | type   | Option      |
| ------ | ------ | ----------- |
| category_id   | references | FK: true |
| size_id   | references | FK: true |

Association

- belongs_to :category
- belongs_to :size

## brandsテーブル

| Column      | Type       | Options               |
| ----------- | ---------- | --------------------- |
| brand_group_id    | references | FK: true |
| name        | string     | null: false           |

Association

- has_many :item
- belongs_to :brand_group

***

## brand_groupsテーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

Association

- has_many :brands
- has_many :category_brand_groups
- has_many :categories, through: :category_brand_groups

***

## category_brand_groupsテーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| category_id   | references | FK: true |
| brand_group_id   | references | FK: true |

Association

- belongs_to :brand_group
- belongs_to :category

***



## shippingsテーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| fee_burden    | boolean | null: false |
| service       | integer | null: false |
| area          | integer | null: false |
| handling_time | integer | null: false |
| item_id   | references | null: false, FK: true |

Association

- belongs_to :item, optional: true

***

## addressテーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| city   | string | null: false |
| prefecture_id   | integer | null: false |

Association

- belongs_to_active_hash :prefecture
- belongs_to :item

## cards(クレジットカード)

***

**pay.jp**で実装するため不要

***

## ER図
アプリ作成前の想定 draw.io Diagramsで作成
<img src="https://i.imgur.com/Maikuue.jpg" alt="ER図" title="メルカリER図">


アプリ完成後 gem 'rails-erd'で自動生成
<img src="https://i.imgur.com/eGKlSN9.png" alt="ER図" title="メルカリER図">