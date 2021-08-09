FactoryBot.define do
  factory :child do
    name { Fake::Name.name }
    age { 2 }
    parent
  end
end
