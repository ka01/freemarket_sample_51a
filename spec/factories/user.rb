FactoryBot.define do

  factory :user do
    nickname              {"eguchan"}
    email                 {"jojojo@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    family_name           {"江口"}
    first_name            {"恵太"}
    family_name_kana      {"エグチ"}
    first_name_kana       {"ケイタ"}
    birth_year            {"1991"}
    birth_month           {"10"}
    birth_day             {"21"}
  end

end
