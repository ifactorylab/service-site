# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :booking do
    date "2015-07-10 00:15:14"
    time "2015-07-10 00:15:14"
    number_of_person 1
    first_name "MyString"
    last_name "MyString"
    email "MyString"
    phone_number "MyString"
    note "MyText"
    site_id "MyString"
    status 1
    partner_notified false
    customer_notified false
  end
end
