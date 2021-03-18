FactoryBot.define do
  factory :notification do
    contact_id      { nil }
    reservation_id  { nil }
    review_id       { nil }
    action          { nil }
  end
end