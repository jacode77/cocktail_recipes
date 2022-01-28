# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
spirits = ["Vodka", "Gin", "Rum", "Whisky", "Bourbon", "Brandy", "Vermouth", "Moonshine"] #Arrays start at 0, databases start at 1

if BaseSpirit.count == 0
    spirits.each do |spirit|
        BaseSpirit.create(name: spirit)
        puts "Created #{spirit}"
    end
end

if Cocktail.count == 0
    Cocktail.create(name: "Espresso Martini", base_spirit_id: 1, instructions: "Place vodka, kahlua and espresso in a cocktail shaker.")
    puts "Created Espresso Martini"
    Cocktail.create(name: "Negroni", base_spirit_id: 2, instructions: "Pour the gin, vermouth and Campari into a mixing glass or jug with ice. Stir well until the outside of the glass feels cold. Strain into a tumbler and add 1 large ice sphere or some fresh ice, and garnish with an orange slice, using a blood orange when in season.")
    puts "Created Negroni"
    Cocktail.create(name: "Old Fashioned", base_spirit_id: 4, instructions: "Mix whisky with orange peel")
    puts "Created Old Fashioned"
end