FactoryBot.define do

  factory :shipping_info do
    family_name           {"山田"}
    family_name_kana      {"ヤマダ"}
    first_name            {"太郎"}
    first_name_kana       {"タロウ"}
    postal_code           {"111-1111"}
    prefecture_id         {1}
    city                  {"神戸市"}
    address               {"兵庫区テスト町1-1"}
    building              {"テストビル"}
    phone_number          {"08011112222"}
  end
end