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

categorys=[
            {level1:"レディース",level1_children:[
                                        {level2:"トップス",level2_children:["Tシャツ/カットソー(半袖/袖なし)","Tシャツ/カットソー(七分/長袖)","シャツ/ブラウス(半袖/袖なし)","シャツ/ブラウス(七分/長袖)","ポロシャツ","キャミソール","タンクトップ","ホルターネック","ニット/セーター","チュニック","カーディガン/ボレロ","アンサンブル","ベスト/ジレ","パーカー","トレーナー/スウェット","ベアトップ/チューブトップ","ジャージ","その他"]},
                                        {level2:"ジャケット/アウター",level2_children:["テーラードジャケット","ノーカラージャケット","Gジャン/デニムジャケット","レザージャケット","ダウンジャケット","ライダースジャケット","ミリタリージャケット","ダウンベスト","ジャンパー/ブルゾン","ポンチョ","ロングコート","トレンチコート","ダッフルコート","ピーコート","チェスターコート","モッズコート","スタジャン","毛皮/ファーコート","スプリングコート","スカジャン","その他"]},
                                        {level2:"パンツ	",level2_children:["デニム/ジーンズ","ショートパンツ","カジュアルパンツ","ハーフパンツ","チノパン","ワークパンツ/カーゴパンツ","クロップドパンツ","サロペット/オーバーオール","オールインワン","サルエルパンツ","ガウチョパンツ","その他"]},
                                        {level2:"スカート	",level2_children:["ミニスカート","ひざ丈スカート","ロングスカート","キュロット","その他"]},
                                        {level2:"ワンピース",level2_children:["ミニワンピース","ひざ丈ワンピース","ロングワンピース","その他",]},
                                        {level2:"靴",level2_children:["ハイヒール/パンプス","ブーツ","サンダル","スニーカー","ミュール","モカシン","ローファー/革靴","フラットシューズ/バレエシューズ","長靴/レインシューズ","その他"]},
                                        {level2:"ルームウェア/パジャマ",level2_children:["パジャマ","ルームウェア"]},
                                        {level2:"レッグウェア	",level2_children:["ソックス","スパッツ/レギンス","ストッキング/タイツ","レッグウォーマー","その他"]},
                                        {level2:"帽子",level2_children:["ニットキャップ/ビーニー","ハット","ハンチング/ベレー帽","キャップ","キャスケット","麦わら帽子","その他"]},
                                        {level2:"バッグ",level2_children:["ハンドバッグ","トートバッグ","エコバッグ","リュック/バックパック","ボストンバッグ","スポーツバッグ","ショルダーバッグ","クラッチバッグ","ポーチ/バニティ","ボディバッグ/ウェストバッグ","マザーズバッグ","メッセンジャーバッグ","ビジネスバッグ","旅行用バッグ/キャリーバッグ","ショップ袋","和装用バッグ","かごバッグ","その他"]},
                                        {level2:"アクセサリー",level2_children:["ネックレス","ブレスレット","バングル/リストバンド","リング","ピアス(片耳用)","ピアス(両耳用)","イヤリング","アンクレット","ブローチ/コサージュ","チャーム","その他"]},
                                        {level2:"ヘアアクセサリー",level2_children:["ヘアゴム/シュシュ","ヘアバンド/カチューシャ","ヘアピン","その他"]},
                                        {level2:"小物",level2_children:["長財布","折り財布","コインケース/小銭入れ","名刺入れ/定期入れ","キーケース","キーホルダー","手袋/アームカバー","ハンカチ","ベルト","マフラー/ショール","ストール/スヌード","バンダナ/スカーフ","ネックウォーマー","サスペンダー","サングラス/メガネ","モバイルケース/カバー","手帳","イヤマフラー","傘","レインコート/ポンチョ","ミラー","タバコグッズ","その他"]},
                                        {level2:"時計",level2_children:["腕時計(アナログ)","腕時計(デジタル)","ラバーベルト","レザーベルト","金属ベルト","その他"]},
                                        {level2:"ウィッグ/エクステ",level2_children:["前髪ウィッグ","ロングストレート","ロングカール","ショートストレート","ショートカール","その他"]},
                                        {level2:"浴衣/水着",level2_children:["浴衣","着物","振袖","長襦袢/半襦袢","水着セパレート","水着ワンピース","水着スポーツ用","その他"]},
                                        {level2:"スーツ/フォーマル/ドレス",level2_children:["スカートスーツ上下","パンツスーツ上下","ドレス","パーティーバッグ","シューズ","ウェディング","その他"]},
                                        {level2:"マタニティ",level2_children:["トップス","アウター","インナー","ワンピース","パンツ/スパッツ","スカート","パジャマ","授乳服","その他"]},
                                        {level2:"その他",level2_children:["コスプレ","下着","その他"]}
                                      ]
            },
                        {level1:"メンズ",level1_children:[
                                        {level2:"トップス",level2_children:["Tシャツ/カットソー(半袖/袖なし)","Tシャツ/カットソー(七分/長袖)","シャツ","ポロシャツ","タンクトップ","ニット/セーター","パーカー","カーディガン","スウェット","ジャージ","ベスト","その他"]},
                                        {level2:"ジャケット/アウター",level2_children:["テーラードジャケット","ノーカラージャケット","Gジャン/デニムジャケット","レザージャケット","ダウンジャケット","ライダースジャケット","ミリタリージャケット","ナイロンジャケット","フライトジャケット","ダッフルコート","ピーコート","ステンカラーコート","トレンチコート","モッズコート","チェスターコート","スタジャン","スカジャン","ブルゾン","マウンテンパーカー","ダウンベスト","ポンチョ","カバーオール","その他"]},
                                        {level2:"パンツ",level2_children:["デニム/ジーンズ","ワークパンツ/カーゴパンツ","スラックス","チノパン","ショートパンツ","ペインターパンツ","サルエルパンツ","オーバーオール","その他"]},
                                        {level2:"靴",level2_children:[]},
                                        {level2:"バッグ",level2_children:[]},
                                        {level2:"スーツ",level2_children:[]},
                                        {level2:"帽子",level2_children:[]},
                                        {level2:"アクセサリー",level2_children:[]},
                                        {level2:"小物",level2_children:[]},
                                        {level2:"時計",level2_children:[]},
                                        {level2:"水着",level2_children:[]},
                                        {level2:"レッグウェア",level2_children:[]},
                                        {level2:"アンダーウェア",level2_children:[]},
                                        {level2:"その他",level2_children:[]}
                                      ]
            },
                        {level1:"ベビー・キッズ",level1_children:[
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]}
                                      ]
            },
                        {level1:"インテリア・住まい・小物",level1_children:[
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]}
                                      ]
            },
                        {level1:"本・音楽・ゲーム",level1_children:[
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]}
                                      ]
            },
            {level1:"おもちゃ・ホビー・グッズ",level1_children:[
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]}
                                      ]
            },
                        {level1:"コスメ・香水・美容",level1_children:[
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]}
                                      ]
            },
                        {level1:"家電・スマホ・カメラ",level1_children:[
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]}
                                      ]
            },
                                    {level1:"スポーツ・レジャー",level1_children:[
                                        {level2:"ゴルフ",level2_children:["クラブ","ウエア(男性用)","ウエア(女性用)","バッグ","シューズ(男性用)","シューズ(女性用)","アクセサリー","その他"]},
                                        {level2:"フィッシング",level2_children:["ロッド","リール","ウエア(女性用)","ルアー用品","ウエア","釣り糸/ライン","その他"]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]}
                                      ]
            },
                        {level1:"ハンドメイド",level1_children:[
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]}
                                      ]
            },
                        {level1:"チケット",level1_children:[
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]}
                                      ]
            },
                                    {level1:"自動車・オートバイ",level1_children:[
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]}
                                      ]
            },
                        {level1:"その他",level1_children:[
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]},
                                        {level2:"",level2_children:[]}
                                      ]
            }
          ]
categorys.each.with_index(1) do |category,i|
  level1_var="@category#{i}"                                                        #1階層の変数("@category1"等)
  level1_val= Category.create(name:"#{category[:level1]}")                          #1階層の値作成("メンズ"等)
  eval("#{level1_var} = level1_val")                                                #1階層の変数=値
    category[:level1_children].each.with_index(1) do |level1_child,j|
      level2_var="#{level1_var}_#{j}"                                               #2階層の変数("@category1-1"等)
      level2_val= eval("#{level1_var}.children.create(name:level1_child[:level2])") #2階層の値作成("トップス"等)
      eval("#{level2_var} = level2_val")                                            #2階層の変数=値
        level1_child[:level2_children].each do |level2_children_val|
          eval("#{level2_var}.children.create(name:level2_children_val)")           #3階層の値作成("Tシャツ/カットソー(半袖/袖なし)"等)
        end
    end
end


# category9s=[{level2:"ゴルフ",level2_children:["クラブ","ウエア(男性用)","ウエア(女性用)","バッグ","シューズ(男性用)","シューズ(女性用)","アクセサリー","その他"]},
#             {level2:"フィッシング",level2_children:["ロッド","リール","ウエア(女性用)","ルアー用品","ウエア","釣り糸/ライン","その他"]}]
# category9s.each.with_index(1) do |category9,j|
#   level2_var="@category9_#{j}"
#   level2_val= @category9.children.create(name:"#{category9[:level2]}")
#   eval("#{level2_var} = level2_val")
#   category9[:level2_children].each.with_index(1) do |level2_children_val,i|
#     eval("#{level2_var}.children.create(name:level2_children_val)")
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