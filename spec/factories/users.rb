FactoryBot.define do

  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password}
    first_name_zenkaku    {Faker::Name.first_name}
    last_name_zenkaku     {Faker::Name.last_name}
    first_name_kana       {Gimei.first.katakana}
    last_name_kana        {Gimei.last.katakana}
    birthday              {Faker::Date.birthday}
  end

end