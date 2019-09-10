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
                                        {level2:"靴",level2_children:["スニーカー","サンダル","ブーツ","モカシン","ドレス/ビジネス","長靴/レインシューズ","デッキシューズ","その他"]},
                                        {level2:"バッグ",level2_children:["ショルダーバッグ","トートバッグ","ボストンバッグ","リュック/バックパック","ウエストポーチ","ボディーバッグ","ドラムバッグ","ビジネスバッグ","トラベルバッグ","メッセンジャーバッグ","エコバッグ","その他"]},
                                        {level2:"スーツ",level2_children:["スーツジャケット","スーツベスト","スラックス","セットアップ","その他"]},
                                        {level2:"帽子",level2_children:["キャップ","ハット","ニットキャップ/ビーニー","ハンチング/ベレー帽","キャスケット","サンバイザー","その他"]},
                                        {level2:"アクセサリー",level2_children:["ネックレス","ブレスレット","バングル/リストバンド","リング","ピアス(片耳用)","ピアス(両耳用)","アンクレット","その他"]},
                                        {level2:"小物",level2_children:["長財布","折り財布","マネークリップ","コインケース/小銭入れ","名刺入れ/定期入れ","キーケース","キーホルダー","ネクタイ","手袋","ハンカチ","ベルト","マフラー","ストール","バンダナ","ネックウォーマー","サスペンダー","ウォレットチェーン","サングラス/メガネ","モバイルケース/カバー","手帳","ストラップ","ネクタイピン","カフリンクス","イヤマフラー","傘","レインコート","ミラー","タバコグッズ","その他"]},
                                        {level2:"時計",level2_children:["腕時計(アナログ)","腕時計(デジタル)","ラバーベルト","レザーベルト","金属ベルト","その他"]},
                                        {level2:"水着",level2_children:["一般水着","スポーツ用","アクセサリー","その他"]},
                                        {level2:"レッグウェア",level2_children:["ソックス","レギンス/スパッツ","レッグウォーマー","その他"]}
                                      ]
            },
                        {level1:"ベビー・キッズ",level1_children:[
                                        {level2:"ベビー服(女の子用)  ~95cm",level2_children:["トップス","アウター","パンツ","スカート","ワンピース","ベビードレス","おくるみ","下着/肌着","パジャマ","ロンパース","その他"]},
                                        {level2:"ベビー服(男の子用)  ~95cm",level2_children:["トップス","アウター","パンツ","スカート","ワンピース","ベビードレス","おくるみ","下着/肌着","パジャマ","ロンパース","その他"]},
                                        {level2:"ベビー服(男女兼用)  ~95cm",level2_children:["トップス","アウター","パンツ","スカート","ワンピース","ベビードレス","おくるみ","下着/肌着","パジャマ","ロンパース","その他"]},
                                        {level2:"キッズ服(女の子用) 100cm~",level2_children:["コート","ジャケット/上着","トップス(Tシャツ/カットソー)","トップス(トレーナー)","トップス(チュニック)","トップス(タンクトップ)","トップス(その他)","スカート","パンツ","ワンピース","セットアップ","パジャマ","フォーマル/ドレス","和服","浴衣","甚平","水着","その他"]},
                                        {level2:"キッズ服(男の子用) 100cm~",level2_children:["コート","ジャケット/上着","トップス(Tシャツ/カットソー)","トップス(トレーナー)","トップス(チュニック)","トップス(タンクトップ)","トップス(その他)","スカート","パンツ","ワンピース","セットアップ","パジャマ","フォーマル/ドレス","和服","浴衣","甚平","水着","その他"]},
                                        {level2:"キッズ服(男女兼用) 100cm~",level2_children:["コート","ジャケット/上着","トップス(Tシャツ/カットソー)","トップス(トレーナー)","トップス(その他)","ボトムス","パジャマ","その他"]},
                                        {level2:"キッズ靴",level2_children:["スニーカー","サンダル","ブーツ","長靴","その他"]},
                                        {level2:"子ども用ファッション小物",level2_children:["靴下/スパッツ","帽子","エプロン","サスペンダー","タイツ","ハンカチ","ベルト","バンダナ","マフラー","傘","手袋","スタイ","バッグ","その他"]},
                                        {level2:"おむつ/トイレ/バス",level2_children:["おむつ用品","おまる/補助便座","トレーニングパンツ","ベビーバス","お風呂用品","その他"]},
                                        {level2:"外出/移動用品",level2_children:["ベビーカー","抱っこひも/スリング","チャイルドシート","その他"]},
                                        {level2:"授乳/食事",level2_children:["ミルク","ベビーフード","ベビー用食器","その他"]},
                                        {level2:"ベビー家具/寝具/室内用品",level2_children:["ベッド","布団/毛布","イス","たんす","その他"]},
                                        {level2:"おもちゃ",level2_children:["おふろのおもちゃ","がらがら","オルゴール","ベビージム","手押し車/カタカタ","知育玩具","その他"]},
                                        {level2:"行事/記念品",level2_children:["お宮参り用品","お食い初め用品","アルバム","手形/足形","その他"]},
                                        {level2:"その他",level2_children:["母子手帳用品","その他"]}
                                      ]
            },
                        {level1:"インテリア・住まい・小物",level1_children:[
                                        {level2:"キッチン/食器",level2_children:["食器","調理器具","収納/キッチン雑貨","弁当用品","カトラリー(スプーン等)","テーブル用品","容器","エプロン","アルコールグッズ","浄水器","その他"]},
                                        {level2:"ベッド/マットレス",level2_children:["セミシングルベッド","シングルベッド","セミダブルベッド","ダブルベッド","ワイドダブルベッド","クイーンベッド","キングベッド","脚付きマットレスベッド","マットレス","すのこベッド","ロフトベッド/システムベッド","簡易ベッド/折りたたみベッド","収納付き","その他"]},
                                        {level2:"ソファ/ソファベッド",level2_children:["ソファセット","シングルソファ","ラブソファ","トリプルソファ","オットマン","コーナーソファ","ビーズソファ/クッションソファ","ローソファ/フロアソファ","ソファベッド","応接セット","ソファカバー","リクライニングソファ","その他"]},
                                        {level2:"椅子/チェア",level2_children:["一般","スツール","ダイニングチェア","ハイバックチェア","ロッキングチェア","座椅子","折り畳みイス","デスクチェア","その他"]},
                                        {level2:"机/テーブル",level2_children:["こたつ","カウンターテーブル","サイドテーブル","センターテーブル","ダイニングテーブル","座卓/ちゃぶ台","アウトドア用","パソコン用","事務机/学習机","その他"]},
                                        {level2:"収納家具",level2_children:["リビング収納","キッチン収納","玄関/屋外収納","バス/トイレ収納","本収納","本/CD/DVD収納","洋服タンス/押入れ収納","電話台/ファックス台","ドレッサー/鏡台","棚/ラック","ケース/ボックス","その他"]},
                                        {level2:"ラグ/カーペット/マット",level2_children:["ラグ","カーペット","ホットカーペット","玄関/キッチンマット","トイレ/バスマット","その他"]},
                                        {level2:"カーテン/ブラインド",level2_children:["カーテン","ブラインド","ロールスクリーン","のれん","その他"]},
                                        {level2:"ライト/照明",level2_children:["蛍光灯/電球","天井照明","フロアスタンド","その他"]},
                                        {level2:"寝具",level2_children:["布団/毛布","枕","シーツ/カバー","その他"]},
                                        {level2:"インテリア小物",level2_children:["ごみ箱","ウェルカムボード","オルゴール","クッション","クッションカバー","スリッパラック","ティッシュボックス","バスケット/かご","フォトフレーム","マガジンラック","モビール","花瓶","灰皿","傘立て","小物入れ","置時計","掛時計/柱時計","鏡(立て掛け式)","鏡(壁掛け式)","置物","風鈴","植物/観葉植物","その他"]},
                                        {level2:"季節/年中行事",level2_children:["正月","成人式","バレンタインデー","ひな祭り","子どもの日","母の日","父の日","サマーギフト/お中元","夏/夏休み","ハロウィン","敬老の日","七五三","お歳暮","クリスマス","冬一般","その他"]},
                                        {level2:"その他",level2_children:[]}
                                      ]
            },
                        {level1:"本・音楽・ゲーム",level1_children:[
                                        {level2:"本",level2_children:["文学/小説","人文/社会","ノンフィクション/教養","地図/旅行ガイド","ビジネス/経済","健康/医学","コンピュータ/IT","趣味/スポーツ/実用","住まい/暮らし/子育て","アート/エンタメ","洋書","絵本","参考書","その他"]},
                                        {level2:"漫画",level2_children:["全巻セット","少年漫画","少女漫画","青年漫画","女性漫画","同人誌","その他"]},
                                        {level2:"雑誌",level2_children:["アート/エンタメ/ホビー","ファッション","ニュース/総合","趣味/スポーツ","その他"]},
                                        {level2:"CD",level2_children:["邦楽","洋楽","アニメ","クラシック","K-POP/アジア","キッズ/ファミリー","その他"]},
                                        {level2:"DVD/ブルーレイ",level2_children:["外国映画","日本映画","アニメ","TVドラマ","ミュージック","お笑い/バラエティ","スポーツ/フィットネス","キッズ/ファミリー","その他"]},
                                        {level2:"レコード",level2_children:["邦楽","洋楽","その他"]},
                                        {level2:"テレビゲーム",level2_children:["家庭用ゲーム本体","家庭用ゲームソフト","携帯用ゲーム本体","携帯用ゲームソフト","PCゲーム","その他"]}
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