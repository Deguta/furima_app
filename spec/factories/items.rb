FactoryBot.define do

  factory :item do
    name               {"テスト"}
    description        {"説明文"}
    category           {"レディース"}
    brand              {"ルイヴィトン"}
    condition          {"新品、未使用"}
    shipping_cost      {"送料込み(出品者負担"}
    prefecture_id      {1}
    shipping_day       {"1日から2日で配送"}
    shipping_method    {"メルカリ便"}
    price              {"100000"}
    item_size          {"L"}
    association :user
  end
end