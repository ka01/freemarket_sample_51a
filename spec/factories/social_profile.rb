FactoryBot.define do
  factory :social_profile do
    provider            {"facebook"}
    uid                 {"1234567890"}
    user_id             { 1 }
  end
end