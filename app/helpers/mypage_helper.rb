module MypageHelper
  def mypages
    titles = [{title: "マイページ",url: "/mypage"},
              {title: "お知らせ",url:"/mypage/notification/"},
              {title: "やることリスト",url:"/mypage/todo/"},
              {title: "いいね！一覧",url:"/mypage/like/history/"},
              {title: "出品する",url:"/items/new"},
              {title: "出品した商品 - 出品中",url:"/mypage/listings/listing/"},
              {title: "出品した商品 - 取引中",url:"/mypage/listings/in_progress/"},
              {title: "出品した商品 - 売却済み",url:"/mypage/listings/completed/"},
              {title: "購入した商品 - 取引中",url:"/mypage/purchase/"},
              {title: "購入した商品 - 過去の取引",url:"/mypage/purchased/"},
              {title: "ニュース一覧",url:"/mypage/news/"},
              {title: "評価一覧",url:"/mypage/review/history/"},
              {title: "ガイド",url:"/help_center/"},
              {title: "お問い合わせ",url:"/mypage/support/"}]
  end

  def merpays
    titles = [{title: "残高・振込申請",url:"/jp/mypage/sales/"},
             {title: "ポイント",url:"/jp/mypage/point/"},]
  end

  def settings
    titles = [{title: "プロフィール",url:"/mypage/profile/"},
              {title: "発送元・お届け先住所変更",url:"/jp/mypage/deliver_address/"},
              {title: "支払い方法",url:"/mypage/card/"},
              {title: "メール/パスワード",url:"/jp/mypage/email_password/"},
              {title: "本人情報",url:"/mypage/identification/"},
              {title: "電話番号の確認",url:"/jp/mypage/sms_confirmation/"},
              {title: "ログアウト",url:"/mypage/logout/"}]
  end

  def notifications
    #  titles = []
    titles = [{content: "登録済み電話番号の確認をお願いします",time:"22 時間前"},
              {content: "3日後、8%還元お得チケットの有効期限が切れます！タップして詳細を確認しましょう。",time:"1 日前"},
              {content: "連休は断捨離しよう！今なら出品するだけで5%のお得チケットがもらえる♪詳しくはこちらから",time:"2 日前"},
              {content: "《5%お得チケット》が”5枚”もらえる！出品するほどお得なキャンペーンはこちらから♪",time:"2 日前"},
              {content: "《8%ポイント還元》得々祭期間中に使えるお得チケットをプレゼントしました",time:"4 日前"},
              {content: "《出品するだけ》5%のお得チケットが最大“5枚”もらえる！出品得々祭が開催中♪",time:"4 日前"},
              {content: "事務局からの個別メッセージ「ログイン通知」",time:"11日前"},
              {content: "事務局からの個別メッセージ「ログイン通知」",time:"14日前"},]
  end

  def todos
    # titles=[]
    titles = [{content: "小松さんから「スマホケース」の取引メッセージがあります。返信をお願いします",time:"22 時間前"},
              {content: "菅原さんが「BenQ ディスプレイ（箱付き）」を購入しました。住所を確認の上、発送をお願いします",time:"1 日前"},
              {content: "鈴木さんから「Macbook Air 2011]の取引メッセージがあります。返信をお願いします",time:"2 日前"},]
  end

  def purchases
    # titles=[]
    titles = [{name: "コーラ",url:"http://placehold.jp/cc9999/993333/60x60.png",state:"発送待ち"},
              {name: "サイダー",url:"http://placehold.jp/cc9999/993333/60x60.png",state:"発送待ち"},
              {name: "ファンタグレープ",url:"http://placehold.jp/cc9999/993333/60x60.png",state:"受け取り評価待ち"},]
  end

  def purchaseds
    # titles=[]
    titles = [{name: "うまい棒",url:"http://placehold.jp/cc9999/993333/60x60.png"},
              {name: "5円チョコ",url:"http://placehold.jp/cc9999/993333/60x60.png"},
              {name: "柿の種",url:"http://placehold.jp/cc9999/993333/60x60.png"},
              {name: "串団子",url:"http://placehold.jp/cc9999/993333/60x60.png"},]
  end
end
