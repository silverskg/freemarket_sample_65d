FactoryBot.define do

  factory :item do
    id                    {"1"}
    name                  {"abe"}
    status                {"新品・未使用"}
    body                  {"edf"}
    deliver_fee           {"送料込み(出品者負担)"}
    delivery_date         {"1~2日で発送"}
    how_to_deliver        {"らくらくメルカリ便"}
    region                {"2"}
    price                 {"1000"}
    created_at            {"2020-01-01 10:10:10"}
    updated_at            {"2020-01-01 10:10:10"}
    category_id {1}
    brand_id {1}
    category
    brand
    # user
  end

end