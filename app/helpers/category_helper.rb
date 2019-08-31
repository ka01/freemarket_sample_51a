module CategoryHelper
  def categories
    names = [{name: "レディース",path:"1/"url: "/"},
              {name: "メンズ",url:"/mypage/notification/"},
              {name: "ベビーキッズ",url:"/mypage/todo/"},
              {name: "インテリア・住まい",url:"/mypage/like/history/"},
              {name: "本・音楽・ゲーム",url:"/sell/"},
              {name: "おもちゃ・ホビー・グッズ",url:"/mypage/listings/listing/"},
              {name: "コスメ・香水・美容",url:"/mypage/listings/in_progress/"},
              {name: "家電・スマホ・カメラ",url:"/mypage/listings/completed/"},
              {name: "スポーツ・レジャー",url:"/mypage/purchase/"},
              {name: "ハンドメイド",url:"/mypage/purchased/"},
              {name: "チケット",url:"/mypage/news/"},
              {name: "自動車・オートバイ",url:"/mypage/review/history/"},
              {name: "その他",url:"/help_center/"}]
  end
end