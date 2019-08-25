class Shipping < ApplicationRecord
  belongs_to :item
# b928f6c4371495c7244e6bfd6325dc53f1ad6a18
# 上記の文字列はプッシュ時にコンフリクトとして出てきたもの。
# 思い当たるフシがないので一応問題ないことがわかるまでコメントアウト
end