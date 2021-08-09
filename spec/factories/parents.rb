FactoryBot.define do
  factory :parent do
    name { Faker::Name.name }
    age { 35 }
    married { true }
  end
end
