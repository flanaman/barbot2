# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cocktails = [{name: 'Manhattan', description: 'mostly bourbon', rating: 5},
    	  {name: 'Martini', description: 'mostly gin', rating: 3},
    	  {name: 'Grog', description: 'rum and lime', rating: 2},
    	  {name: 'Negroni', description: 'bitter', rating: 5}
  	 ]
generics = [{name: 'whiskey', category: 'liquor'},
        {name: 'gin', category: 'liquor'},
        {name: 'rum', category: 'liquor'}
     ]
ingredients = [{name: 'Laphroig 10',  proof: 80,
        rating: 5, description: 'smokey and mineral-y'},
        {name: 'New Amsterdam', rating: 3, proof: 80,
        description: 'mild and dry'},
        {name: 'Ron Barcelo Anejo', rating: 3, proof: 80,
        description: 'gold and mixable'}
     ]
# cocktails.each do |cocktail|
#   Cocktail.create!(cocktail)
# end
# generics.each do |generic|
#   Generic.create!(generic)
# end
# ingredients.each do |ingredient|
#   Ingredient.create!(ingredient)
# end
# Ingredtype.where(name: 'whiskey')<<Ingredient.where(name: 'Laphroig 10')
# Ingredtype.where(name: 'gin').ingredient<<Ingredient.where(name: 'New Amsterdam')
# Ingredtype.where(name: 'rum').ingredient<<Ingredient.where(name: 'Ron Barcelo Anejo')
