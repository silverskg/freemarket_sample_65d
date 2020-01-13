FactoryBot.define do

  factory :address do
    first_name_zenkaku    {Faker::Name.first_name}
    last_name_zenkaku     {Faker::Name.last_name}
    first_name_kana       {Gimei.first.katakana}
    last_name_kana        {Gimei.last.katakana}
    post_number           {Faker::Address.zip_code}
    prefectures           {Faker::Number.between(from: 0, to: 48)}
    city                  { Faker::Address.city}
    addresses_banchi      {Faker::Address.building_number}
  
  end

end