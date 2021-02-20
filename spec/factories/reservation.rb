FactoryBot.define do
  factory :reservation do
    room_id     { 1 }
    guest_id    { 1 }
    people      { 1 }
    start_date  {"2021-02-20"}
    end_date    {"2021-02-21"}
  end
end