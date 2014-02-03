namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example User",
                 email: "example@bananas.org",
                 password: "foobar",
                 password_confirmation: "foobar")
    40.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@bananas.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end   
    users = User.all(limit: 6)
    50.times do
      name = Faker::Lorem.words(2).join(" ")
      description = Faker::Lorem.sentence
      rating = rand(6)
      users.each { |user| user.cocktails.create!(name: name,
        description: description, rating: rating) }
    end
  end
end