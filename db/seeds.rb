# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

CSV.foreach('db/category.csv', headers: true) do |row|
  Category.create(
    name: row[1],
    path: row[2]
  )
end

# row[]の数字はcsvファイルの列を指定している
# どの行をどこのカラム名に入れたらいいのか、を上で書いている
# ここでrow[0]を指定するとcsvで言うところのidの列を入れてしまうことになる

CSV.foreach('db/size.csv', headers: true) do |row|
  Size.create(
    size: row["size"]
  )
end