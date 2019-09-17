(1..5).each do |n|
  gimei = Gimei.new
  address = Gimei.address
  User.create!(email:"sample#{n}@sample.com",
                password:"password",
                password_confirmation:"password",
                family_name:gimei.last.kanji,
                first_name:gimei.first.kanji,
                family_name_kana:gimei.last.katakana,
                first_name_kana:gimei.first.katakana,
                birth_year:2000,
                birth_month:2,
                birth_day:5,
                status:0,
                nickname:gimei.katakana ,
                introduction:"")
  DeliverAdress.create!(user_id:n,
                        family_name:gimei.last.kanji,
                        first_name:gimei.first.kanji,
                        family_name_kana:gimei.last.katakana,
                        first_name_kana:gimei.first.katakana,
                        zip_code:111,
                        prefecture:n,
                        city:address.city.kanji,
                        adress1:address.town.kanji,
                        adress2:"#{n}丁目#{n}-#{n}",
                        telephone:"080#{n}#{n}#{n}#{n}#{n}#{n}#{n}#{n}")
end