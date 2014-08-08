# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :appointment do
    day "2014-08-07"
    time 1
    pet_id 1
    walker_id 1
  end
end
