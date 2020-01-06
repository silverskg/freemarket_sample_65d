FactoryBot.define do

  factory :user do
    id                    {"1"}
    nickname              {"abe"}
    first_name_zenkaku    {"tech"}
    last_name_zenkaku     {"tech"}
    first_name_kana       {"expert"}
    last_name_kana        {"expert"}
    birthday              {"19991111"}
    email                 {"111@111"}
    password              {"111111"}
    encrypted_password    {"111111"}
    created_at            {"2020-01-01 10:10:10"}
    updated_at            {"2020-01-01 10:10:10"}
  end

end