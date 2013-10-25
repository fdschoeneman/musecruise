# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tour do
    start_date "2013-10-25"
    end_date "2013-10-25"
    questions "MyString"
  end
end
