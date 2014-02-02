FactoryGirl.define do
  factory :user do
    name     "mark"
    email    "mark@mark.com"
    password "foobar"
    password_confirmation "foobar"
  end
end