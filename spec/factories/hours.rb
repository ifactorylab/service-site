# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :hour do
    business_id "MyString"
    day "MyString"
    start_hour 1
    end_hour 1
  end
end
