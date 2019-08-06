## 最終課題
**freemarket_app**
## WHAT
DB設計
## WHY
チームメンバーと共有する為

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
|password|string|null: false, unique: true|
|email|string|null: false, unique: true|

### Association
- has_many :items
- has_many :likes
- has_many :comments
- has many :messages
- has many :points
- has_many :social_providers
- has_one :deliver_adresses
- has_one :user_detail
- has_many :tradings
- has_many :wallets
- has_many :points

## social_providrsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, FK: true|
|provider|string|null :false|

### Association
- belongs_to :user

## deliver_adressesテーブル

|Column|Type|Options|
|------|----|-------|
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
|nickname|string|null: false|
|introduction|text|

### Association
- belongs_to :user

## walletsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, FK: true|
|money|integer|

### Association
- belongs_to :user(合ってる？)

## pointsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, FK: true|
|score|integer|

### Association
- belongs_to :user

## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, FK: true|
|trading_id|references|null: false, FK: true|
|text|text|null: false|

### Association
belongs_to :user
belongs_to :trading


## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|category_id|references|null: false, FK: true|
|shipping_id|references|null: false. FK: true|
|brand_id|references|null: false. FK: true|
|seller_user_id|references|null: false, FK: true|
|buyer_user_id|references|null: false, FK: true|
|name|string|null: false|
|text|text|null: false|
|condition|string|null: false|
|price|integer|null: false|


### Association
- belongs_to :user
- has_many :categories
- has_many :brands
- has_many :likes
- has_many :comments
- has_one :shipping
- has_one :trading
- has_many :item_images

## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, FK: true|
|image_url|string|

### Association
- belongs_to :item


## categoriesテーブル（経路列挙モデル）

|Id|Path|Name|
|------|----|-------|
|1|1/|categories|
|2|1/2|ladies|
|3|1/3|mens|
|4|1/4|BabyKids|
|5|1/5|interior|
|6|1/6|book|
|7|1/7|toy|
|8|1/8|cosme|
|9|1/9|HouseholdAppliance|
|10|1/10|sports|
|11|1/11|HandMade|
|12|1/12|ticket|
|13|1/13|car|
|14|1/14|other|
|15|1/15|watch|
|16|1/16|videogame|
|17|1/17|CarParts|
|18|1/18|smartphone|
|19|1/19|kitchen|
|20|1/2/1|tops|
|21|1/2/2|JacketOuter|
|22|1/2/3|pants|
|23|1/2/4|skirt|
|24|1/2/5|OnePiece|
|25|1/2/6|shoes|
|26|1/2/7|RoomWear|
|27|1/2/8|HeadGear|
|28|1/2/9/|bag|
|29|1/2/10|accessories|
|30|1/2/11|HearAccessories|
|31|1/2/12|komono|
|32|1/2/13|WristWatch|
|33|1/2/14|wig|
|34|1/2/15|yukata|
|35|1/2/16|SuitDress|
|36|1/2/17|maternity|
|37|1/2/18|other|
|38|1/2/1/1|TshirtHalfSleeve|
|39|1/2/1/2|TshirtLongSleeve|
|40|1/2/1/3|ShirtHalfSleeve|
|41|1/2/1/4|ShirtLongSleeve|
|42|1/2/1/5|poloshirt|
|43|1/2/1/6|camisole|
|44|1/2/1/7|tanktop|
|45|1/2/1/8|HalterNeck|
|46|1/2/1/9|KnitSweater|
|47|1/2/1/10|tunic|
|48|1/2/1/11|cardigan|
|49|1/2/1/12|ensemble|
|50|1/2/1/12|vest|
|51|1/2/1/13|hoodie|
|52|1/2/1/13|sweatshirt|
|52|1/2/1/14|BareTop|
|53|1/2/1/15|jersey|
|54|1/2/1/16|other|
|55|1/2/2/1|tailored|
|56|1/2/2/2|NoColloar|
|57|1/2/2/3|DenimJacket|
|58|1/2/2/4|LeatherJacjet|
|59|1/2/2/5|DownJacket|
|60|1/2/2/6|RidersJacket|
|61|1/2/2/7|MilitaryJacket|
|62|1/2/2/8|DownVest|
|63|1/2/2/9|blouson|
|64|1/2/2/10|poncho|
|65|1/2/2/11|LongCoat|
|66|1/2/2/12|TrenchCoat|
|67|1/2/2/13|DuffleCoat|
|68|1/2/2/14|ChesterCoat|
|69|1/2/2/15|ModsCoat|
|70|1/2/2/16|StadiumJumper|
|71|1/2/2/17|FurCoat|
|72|1/2/2/18|SpringCoat|
|73|1/2/2/19|sukajan|
|74|1/2/2/20|other|
|75|1/2/3/1|jeans|
|76|1/2/3/2|shorts|
|77|1/2/3/3|CasualPants|
|78|1/2/3/4|HalfPants|
|79|1/2/3/5|ChinoPants|
|80|1/2/3/6|CargoPants|
|81|1/2/3/7|CroppedPants|
|82|1/2/3/8|Overall|
|83|1/2/3/9|AllInOne|
|84|1/2/3/10|SaruelPants|
|85|1/2/3/11|GauchoPants|
|86|1/2/3/12|other|
|87|1/2/4/1|MiniSkirt|
|88|1/2/4/2|MidiSkirt|
|89|1/2/4/3|LongSkirt|
|90|1/2/4/4|cullote|
|91|1/2/4/5|other|
<!-- 途中まで書いてしまって消すのは名残惜しいので残してます -->

### Association
- belongs_to :item
- has_many :brands

## brands-groupsテーブル

|Column|Type|Options|
|------|----|-------|
|brand_id|references|null: false, FK: true|
|name|string|null: false, unique: true|

### Association
- belongs_to :brand


## shippingsテーブル

|Column|Type|Options|
|------|----|-------|
|FeeBurden|string|
|method|string|
|area|string|
|shipping_period|string|


### Association
- belongs_to :item

## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|category_id|references|null: false, FK: true|
|name|string|null: false|



### Association
- belongs_to :item
- has_many :brand-groups


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, FK: true|
|item_id|references|null: false, FK: true|
|comment|text|null: false|

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

## tradingsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, FK: true|
|item_id|references|null: false, FK: true|
|status|string|null: false|
|completed_at|string|

### Association
- belongs_to :user
- has_one :review(合ってる？)
- has_many :comments(合ってる？)
- has_one :item(合ってる？)

## reviewsテーブル

|Column|Type|Options|
|------|----|-------|
|trading_id|references|null: false, FK: true|
|rate|integer|(null: falseいる？)|
|text|text|(null: falseいる？)|

### Association
- has_one :trading

### cards(クレジットカード)
**pay.jpで実装するので不要**


### 参考
https://tech.mercari.com/entry/2017/11/29/161124
→データ容量が増え続けるから商品テーブルのdescriptionをテーブルから切り離す。将来の拡張性を考えDB設計を考えると別テーブルを作成した方がエンジニアチックでカッコいい
https://teratail.com/questions/171228
https://komiyak.hatenablog.jp/entry/20141103/1415016929
→googleなど外部の認証機能を使う「OAuth 認証」

