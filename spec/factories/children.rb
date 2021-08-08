FactoryBot.define do
  factory :child do
    name { "MyString" }
    age { 1 }
    parent { nil }
  end
end
