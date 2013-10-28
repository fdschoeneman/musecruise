# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :user do
    first_name              "John"
    last_name               "Doe"
    email                   FactoryGirl.generate :email
    password                "password"
    password_confirmation   "password"

    factory :admin do 
      after(:create) { |user| user.add_role(:admin) } 
    end
  end
end


