namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
  make_users 
  make_cocktails
  make_ingredients
  make_components
  end
end


def make_users
  User.create!(name: "Example User",
                 email: "example@bananas.org",
                 password: "foobar",
                 password_confirmation: "foobar")
  32.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@bananas.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
  end   
end

def make_cocktails
  users = User.all(limit: 6)
  10.times do
      name = Faker::Lorem.words(2).join(" ")
      description = Faker::Lorem.sentence
      rating = rand(5)
      users.each { |user| user.cocktails.create!(name: name,
        description: description, rating: rating) }
  end
end

def make_ingredients
  10.times do
    name = Faker::Lorem.words(2).join(" ")
    category = Faker::Lorem.word
    description = Faker::Lorem.sentence
    brand = Faker::Lorem.word
    rating = rand(5)
    proof = rand(200)
    Ingredient.create!(name: name, category: category, 
      brand: brand, proof: proof)
  end
end

def make_components
  cocktails = Cocktail.all(limit: 6)
  ingredients = Ingredient.all(limit: 10)
  cocktails.each do |cocktail|
    3.times do
      amount = ["2 oz", "1 oz", "splash", "1/2 oz"].sample
      ingredient_id = ingredients.sample.id
      cocktail.components.create!(amount: amount, ingredient_id: ingredient_id)
    end
  end
end