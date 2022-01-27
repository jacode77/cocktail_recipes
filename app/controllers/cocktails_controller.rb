require 'json'
class CocktailsController < ApplicationController
    before_action :load_cocktails
    skip_before_action :verify_authenticity_token
    before_action :set_cocktail, only: [:show, :update, :destroy, :edit]

    def index
        # render json: @cocktails
    end

    def new

    end

    def edit
    
    end

    def create
        new_cocktail = {id: @cocktails.last["id"] + 1,  name: params[:name], base: params[:base], instructions: params[:instructions]} 
        @cocktails.push(new_cocktail)
        save_cocktails(@cocktails)
        redirect_to cocktails_path
    end 

    def show
        # render json: @cocktail
    end

    def update
        new_cocktail = {id: @cocktail["id"], name: params[:name], base: params[:base], instructions: params[:instructions]}
        @cocktails[@index] = new_cocktail
        save_cocktails(@cocktails)
        redirect_to cocktail_path(new_cocktail[:id])
    end

    def destroy
        @cocktails.delete_at(@index)
        save_cocktails(@cocktails)
        redirect_to cocktails_path #sends a get request to "get '/cocktails', to: 'cocktails#index', as: 'cocktails'"
    end

    private

    def load_cocktails 
        @cocktails = JSON.parse(File.read(Rails.public_path.join('cocktails.json')))
       end 
    
    def save_cocktails(cocktails)
        File.write(Rails.public_path.join('cocktails.json'), JSON.generate(cocktails))
    end 

    def set_cocktail
        @cocktail = @cocktails.find {|cocktail| cocktail["id"] == params[:id].to_i}
        unless @cocktail
            render file: Rails.public_path.join("404.html"), status: :not_found, layout: false
            return
        end
        @index = @cocktails.index {|cocktail| cocktail["id"] == @cocktail["id"]}
    end
      
end
