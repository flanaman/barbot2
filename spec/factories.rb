FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@bananas.com"}
    password "foobar"
    password_confirmation "foobar"
  end

  factory :cocktail do
    name "Manhattan"
    description "mostly bourbon"
    rating 5
    user
  end
end