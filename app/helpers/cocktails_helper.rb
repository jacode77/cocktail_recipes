module CocktailsHelper
    def generate_button_text(cocktail)
        if cocktail.id
            return "Update #{cocktail.name}"
        else
            return "Create something great!"
        end
    end

    def select_border_color(id)
        case id
        when 1
            return "border-top: 10px solid #935678"
        when 2
            return "border-top: 10px solid #abc472"
        when 3
            return "border-top: 10px solid #9D702E"
        when 4
            return "border-top: 10px solid #d29062"
        when 5
            return "border-top: 10px solid #ffb600"
        when 6
            return "border-top: 10px solid #B7621B"
        when 7
            return "border-top: 10px solid #d7d9d0"
        else
            return "border-top: 10px solid #000000"
        end
    end
end
# "Vodka", "Gin", "Rum", "Whisky", "Bourbon", "Brandy", "Vermouth", "Moonshine"