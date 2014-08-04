# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :behavior do
    dog_aggro false
    human_aggro false
    bad_habits "MyString"
  end
end
