# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :email do
    site_id "MyString"
    content "MyText"
    type 1
  end
end
