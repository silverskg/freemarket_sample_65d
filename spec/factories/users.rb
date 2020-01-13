FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {Faker::Internet.email}
    password              {"00000000r"}
    first_name_zenkaku    {"山田"}
    last_name_zenkaku     {"太郎"}
    first_name_kana       {"ヤマダ"}
    last_name_kana        {"タロウ"}
    birthday              {"200011"}
  end

end