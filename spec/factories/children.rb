FactoryBot.define do
  factory :child do
    name { Faker::Name.name }
    age { 2 }
    parent
  end
end
