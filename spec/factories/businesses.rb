# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :business do
    site_id ""
    name ""
    email ""
    phone ""
    address ""
    city ""
    state ""
    postcode ""
    country ""
  end
end
