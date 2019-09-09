# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

# CSV.foreach('db/category.csv', headers: true) do |row|
#   Category.create(
#     name: row['name'],
#     variable: row['variable']
#   )
# end


# CSV.foreach('db/category.csv', headers: true)  do |i|
# row['variable']= Category.create(row['name'])
# end


# metal, jazz = Category.create([{name: "metal"}, {name: "jazz"}])
category1 = Category.create(name:"レディース")
category2= Category.create(name:"メンズ")
category3= Category.create(name:"ベビー・キッズ")
category4= Category.create(name:"インテリア・住まい・小物")
category5= Category.create(name:"本・音楽・ゲーム")
category6= Category.create(name:"おもちゃ・ホビー・グッズ")
category7= Category.create(name:"コスメ・香水・美容,")
category8= Category.create(name:"家電・スマホ・カメラ")
category9= Category.create(name:"スポーツ・レジャー")
category10= Category.create(name:"ハンドメイド")
category11= Category.create(name:"チケット")
category12= Category.create(name:"自動車・オートバイ")
category13= Category.create(name:"その他")
category1_1= category1.children.create(name:"トップス")
category1_2= category1.children.create(name:"ジャケット/アウター")
category1_3= category1.children.create(name:"パンツ")
category1_4= category1.children.create(name:"スカート")
category1_5= category1.children.create(name:"ワンピース")
category1_6= category1.children.create(name:"靴")
category1_7= category1.children.create(name:"ルームウェア/パジャマ")
category1_8= category1.children.create(name:"レッグウェア")
category1_9= category1.children.create(name:"帽子")
category1_10= category1.children.create(name:"バッグ")
category1_11= category1.children.create(name:"アクセサリー")
category1_12= category1.children.create(name:"ヘアアクセサリー")
category1_13= category1.children.create(name:"小物")
category1_14= category1.children.create(name:"時計")
category1_15= category1.children.create(name:"ウィッグ/エクステ")
category1_16= category1.children.create(name:"浴衣/水着")
category1_17= category1.children.create(name:"スーツ/フォーマル/ドレス")
category1_18= category1.children.create(name:"マタニティ")
category1_19= category1.children.create(name:"その他")
category2_1= category2.children.create(name:"トップス")
category2_2= category2.children.create(name:"ジャケット/アウター")
category2_3= category2.children.create(name:"パンツ")
category2_4= category2.children.create(name:"靴")
category2_5= category2.children.create(name:"バッグ")
category2_6= category2.children.create(name:"スーツ")
category2_7= category2.children.create(name:"帽子")
category2_8= category2.children.create(name:"アクセサリー")
category2_9= category2.children.create(name:"小物")
category2_10= category2.children.create(name:"時計")
category2_11= category2.children.create(name:"水着")
category2_12= category2.children.create(name:"レッグウェア")
category2_13= category2.children.create(name:"アンダーウェア")
category2_14= category2.children.create(name:"その他")
category3_1= category3.children.create(name:"ベビー服(女の子用)  ~95cm")
category3_2= category3.children.create(name:"ベビー服(男の子用)  ~95cm")
category3_3= category3.children.create(name:"ベビー服(男女兼用)  ~95cm")
category3_4= category3.children.create(name:"キッズ服(女の子用) 100cm~")
category3_5= category3.children.create(name:"キッズ服(男の子用) 100cm~")
category3_6= category3.children.create(name:"キッズ服(男女兼用) 100cm~")
category3_7= category3.children.create(name:"キッズ靴")
category3_8= category3.children.create(name:"子ども用ファッション小物")
category3_9= category3.children.create(name:"おむつ/トイレ/バス")
category3_10= category3.children.create(name:"外出/移動用品")
category3_11= category3.children.create(name:"授乳/食事")
category3_12= category3.children.create(name:"ベビー家具/寝具/室内用品")
category3_13= category3.children.create(name:"おもちゃ")
category3_14= category3.children.create(name:"行事/記念品")
category3_15= category3.children..create(name:"その他")
category4_= category4.children..create(name:"その他")






  # category2_3.children.create([{name:"すべて"}, {name:"Tシャツ/カットソー（半袖/袖なし）"},{name:"Tシャツ/カットソー（七分/長袖）"}])
# category1 = Category.create(:name=>"レディース")

# lady_tops = category1.children.create(:name=>"トップス")
# lady_jacket = category1.children.create(:name=>"ジャケット/アウター")
# row[]の数字はcsvファイルの列を指定している
# どの行をどこのカラム名に入れたらいいのか、を上で書いている
# ここでrow[0]を指定するとcsvで言うところのidの列を入れてしまうことになる

CSV.foreach('db/size.csv', headers: true) do |row|
  Size.create(
    size: row["size"]
  )
end