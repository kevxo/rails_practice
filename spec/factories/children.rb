FactoryBot.define do
  factory :child do
    name { Faker::Name.name }
    age { 2 }
    is_adopted { true }
    parent
  end
end
