FactoryBot.define do

  factory :address do
    first_name_zenkaku    {"山田"}
    last_name_zenkaku     {"太郎"}
    first_name_kana       {"ヤマダ"}
    last_name_kana        {"タロウ"}
    post_number           {"1234567"}
    prefectures           {"1"}
    city                  {"広島県広島市"}
    addresses_banchi      {"1111"}
  
  end

end