FactoryBot.define do
  factory :experience, class: Experience do
    name  { Faker::Name.name }
    client_ip  { Faker::Internet.ip_v4_address }
    rating { Faker::Number.decimal(l_digits: 1, r_digits: 2) }
  end
end