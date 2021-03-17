FactoryBot.define do
  factory :review do
    star            { 4.0 }
    comment         {"また行きたいです"}
    name            {"はなこ"}
    age             {"２０代"}
    sex             {"女性"}
    room_id         { 1 }
    score           { Language.get_data("また行きたいです") }
    created_at      {"2021-02-15"}
  end
end