class Shipping < ApplicationRecord
  belongs_to :item
# b928f6c4371495c7244e6bfd6325dc53f1ad6a18
# 上記の文字列はプッシュ時にコンフリクトとして出てきたもの。
# 思い当たるフシがないので一応問題ないことがわかるまでコメントアウト

enum fee_burden: { 
  seller: 0,
  buyer: 1
}

enum service: { 
  undecided: 0,
  rakuraku: 1,
  yumail: 2,
  letterpack: 3,
  postal: 4,
  yamato: 5,
  yupack: 6,
  clickpost: 7,
  yupaket: 8
}

enum handling_time: {
  within2days: 0,
  within3days: 1,
  within7days: 2
}

end