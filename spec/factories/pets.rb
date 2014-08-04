# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pet do
    type ""
    name "MyString"
    photo "MyString"
    size "MyString"
    household_id 1
    allergies "MyString"
    vet_id 1
    age "MyString"
    feeding "MyString"
    notes "MyString"
    behavior_id 1
    supply_id 1
  end
end
