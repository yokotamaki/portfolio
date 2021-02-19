FactoryBot.define do
  factory :guest do
    name          {"山田　太郎"}
    name_kana     {"ヤマダ　タロウ"}
    sex           { true }
    birthday      {"1990-01-01"}
    zipcode       {"1111111"}
    address       {"東京都"}
    phone_number  {"11111111111"}
    email         {"yamada@taro"}
  end
end