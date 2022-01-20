require 'json'
class CocktailsController < ApplicationController
    before_action :load_cocktails
    skip_before_action :verify_authenticity_token

    def index
        render json: @cocktails
    end

    def create
        new_cocktail = {id: @cocktails.last["id"] + 1,  name: params[:name], base: params[:base], instructions: params[:instructions]} 
        @cocktails.push(new_cocktail)
        save_cocktails(@cocktails)
        render json: new_cocktail, status: 201
    end 

    def show
        cocktail = @cocktails.find {|cocktail| cocktail["id"] == params[:id].to_i}
        # pp params[:id] #can use a symbol or string. Params always come back as a string
        if cocktail
            render json: cocktail
        else
            render file: Rails.public_path.join("404.html"), status: :not_found, layout: false
        end
    end

    private

    def load_cocktails 
        @cocktails = JSON.parse(File.read(Rails.public_path.join('cocktails.json')))
       end 
    
       def save_cocktails(cocktails)
        File.write(Rails.public_path.join('cocktails.json'), JSON.generate(cocktails))
       end 
      
end
