# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"


# @category1 = Category.create(name:"レディース")
# @category2= Category.create(name:"メンズ")
# @category3= Category.create(name:"ベビー・キッズ")
# @category4= Category.create(name:"インテリア・住まい・小物")
# @category5= Category.create(name:"本・音楽・ゲーム")
# @category6= Category.create(name:"おもちゃ・ホビー・グッズ")
# @category7= Category.create(name:"コスメ・香水・美容,")
# @category8= Category.create(name:"家電・スマホ・カメラ")
# @category9= Category.create(name:"スポーツ・レジャー")
# @category10= Category.create(name:"ハンドメイド")
# @category11= Category.create(name:"チケット")
# @category12= Category.create(name:"自動車・オートバイ")
# @category13= Category.create(name:"その他")


# category9s=["ゴルフ","フィッシング","自転車","トレーニング/エクササイズ","野球","サッカー/フットサル","テニス","スノーボード","スキー"]
# category9s.each.with_index(1) do |ele,i|
#   var="@category9_#{i}"
#   value= @category9.children.create(name:"#{ele}")
#   eval("#{var} = value")
# end

# category9_1s=["クラブ","ウエア(男性用)","ウエア(女性用)","バッグ","シューズ(男性用)","シューズ(女性用)","アクセサリー","その他"]
# category9_1s.each.with_index(1) do |ele,i|
#   @category9_1.children.create(name:"#{ele}")
# end

categorys=[{level1:"スポーツ・レジャー",level1_child:[{level2:"ゴルフ",level3:["クラブ","ウエア(男性用)","ウエア(女性用)","バッグ","シューズ(男性用)","シューズ(女性用)","アクセサリー","その他"]},
                                                    {level2:"フィッシング",level3:["ロッド","リール","ウエア(女性用)","ルアー用品","ウエア","釣り糸/ライン","その他"]}]},
          {level1:"メンズ",level1_child:[{level2:"トップス",level3:["Tシャツ/カットソー(半袖/袖なし)","Tシャツ/カットソー(七分/長袖)","シャツ","ポロシャツ","タンクトップ","ニット/セーター","パーカー","カーディガン","スウェット","ジャージ","ベスト","その他"]},
                                          {level2:"ジャケット/アウター",level3:["テーラードジャケット","ノーカラージャケット","Gジャン/デニムジャケット","レザージャケット","ダウンジャケット","ライダースジャケット","後で書く","その他"]}]}
          ]
categorys.each.with_index(1) do |category_lv1,k|
  level1_var="@category#{k}"
  level1_val= Category.create(name:"#{category_lv1[:level1]}")
  eval("#{level1_var} = level1_val")
    category_lv1[:level1_child].each.with_index(1) do |category_lv2,j|
      level2_var="#{level1_var}_#{j}"
      level2_val= eval("#{level1_var}.children.create(name:category_lv2[:level2])")
      eval("#{level2_var} = level2_val")
        category_lv2[:level3].each do |level3_val,i|
          eval("#{level2_var}.children.create(name:level3_val)")
        end
    end
end


# category9s=[{level2:"ゴルフ",level3:["クラブ","ウエア(男性用)","ウエア(女性用)","バッグ","シューズ(男性用)","シューズ(女性用)","アクセサリー","その他"]},
#             {level2:"フィッシング",level3:["ロッド","リール","ウエア(女性用)","ルアー用品","ウエア","釣り糸/ライン","その他"]}]
# category9s.each.with_index(1) do |category9,j|
#   level2_var="@category9_#{j}"
#   level2_val= @category9.children.create(name:"#{category9[:level2]}")
#   eval("#{level2_var} = level2_val")
#   category9[:level3].each.with_index(1) do |level3_val,i|
#     eval("#{level2_var}.children.create(name:level3_val)")
#   end
# end

# category9_2s=["","","","","","","",""]
# category9_2s.each.with_index(1) do |ele,i|
#   @category9_2.children.create(name:"#{ele}")
# end

# category9_3s=["","","","","","","",""]
# category9_3s.each.with_index(1) do |ele,i|
#   @category9_3.children.create(name:"#{ele}")
# end

# category9_4s=["","","","","","","",""]
# category9_4s.each.with_index(1) do |ele,i|
#   @category9_4.children.create(name:"#{ele}")
# end

# category9_5s=["","","","","","","",""]
# category9_5s.each.with_index(1) do |ele,i|
#   @category9_5.children.create(name:"#{ele}")
# end

# category_s=["","","","","","","",""]
# category_s.each.with_index(1) do |ele,i|
#   @category_.children.create(name:"#{ele}")
# end


CSV.foreach('db/size.csv', headers: true) do |row|
  Size.create(
    size: row["size"]
  )
end