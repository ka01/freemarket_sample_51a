module MypageHelper
  def mypage
    titles = [{title: "マイページ",url:"/jp/mypage/"},
              {title: "お知らせ",url:"/jp/mypage/notification/"},
              {title: "やることリスト",url:"/jp/mypage/todo/"},
              {title: "いいね！一覧",url:"/jp/mypage/like/history/"},
              {title: "出品する",url:"/jp/sell/"},
              {title: "出品した商品 - 出品中",url:"/jp/mypage/listings/listing/"},
              {title: "出品した商品 - 取引中",url:"/jp/mypage/listings/in_progress/"},
              {title: "出品した商品 - 売却済み",url:"/jp/mypage/listings/completed/"},
              {title: "購入した商品 - 取引中",url:"/jp/mypage/purchase/"},
              {title: "購入した商品 - 過去の取引",url:"/jp/mypage/purchased/"},
              {title: "ニュース一覧",url:"/jp/mypage/news/"},
              {title: "評価一覧",url:"/jp/mypage/review/history/"},
              {title: "ガイド",url:"/jp/help_center/"},
              {title: "お問い合わせ",url:"/jp/mypage/support/"}]
  end

  def merupay
    titles = [{title: "残高・振込申請",url:"/jp/mypage/sales/"},
             {title: "ポイント",url:"/jp/mypage/point/"},]
  end

  def setting
    titles = [{title: "プロフィール",url:"/jp/mypage/profile/"},
              {title: "発送元・お届け先住所変更",url:"/jp/mypage/deliver_address/"},
              {title: "支払い方法",url:"/jp/mypage/card/"},
              {title: "メール/パスワード",url:"/jp/mypage/email_password/"},
              {title: "本人情報",url:"/jp/mypage/identification/"},
              {title: "電話番号の確認",url:"/jp/mypage/sms_confirmation/"},
              {title: "ログアウト",url:"/jp/logout/"}]
  end

  def notification
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

  def todo
    # titles=[]
    titles = [{content: "小松さんから「スマホケース」の取引メッセージがあります。返信をお願いします",time:"22 時間前"},
              {content: "菅原さんが「BenQ ディスプレイ（箱付き）」を購入しました。住所を確認の上、発送をお願いします",time:"1 日前"},
              {content: "鈴木さんから「Macbook Air 2011]の取引メッセージがあります。返信をお願いします",time:"2 日前"},]
  end

  def purchase
    # titles=[]
    titles = [{name: "コーラ",url:"http://placehold.jp/cc9999/993333/60x60.png",state:"発送待ち"},
              {name: "サイダー",url:"http://placehold.jp/cc9999/993333/60x60.png",state:"発送待ち"},
              {name: "ファンタグレープ",url:"http://placehold.jp/cc9999/993333/60x60.png",state:"受け取り評価待ち"},]
  end

  def purchased
    # titles=[]
    titles = [{name: "うまい棒",url:"http://placehold.jp/cc9999/993333/60x60.png"},
              {name: "5円チョコ",url:"http://placehold.jp/cc9999/993333/60x60.png"},
              {name: "柿の種",url:"http://placehold.jp/cc9999/993333/60x60.png"},
              {name: "串団子",url:"http://placehold.jp/cc9999/993333/60x60.png"},]
  end
end
