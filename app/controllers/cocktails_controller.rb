class CocktailsController < ApplicationController
    # skip_before_action :verify_authenticity_token #vulnerable to cross site foragry
    before_action :set_cocktail, only: [:show, :update, :destroy, :edit]
    before_action :set_base_spirits, only: [:new, :edit]

    def index
        @cocktails = Cocktail.all
    end

    def new

    end

    def edit
    
    end

    def create
        Cocktail.create(cocktail_params)
        redirect_to cocktails_path
    end 

    def show

    end

    def update
        @cocktail.update(cocktail_params)
        redirect_to cocktail_path(@cocktail.id)
    end

    def destroy
       @cocktail.delete
       redirect_to cocktails_path
    end

    private


    def set_cocktail
       begin
       id = params[:id].to_i
       @cocktail = Cocktail.find(id)
       rescue
        render file: Rails.public_path.join("404.html"), status: :not_found
       end
    end

    def set_base_spirits
        # Finds and loads all base spirits
        @base_spirits = BaseSpirit.all
    end

    def cocktail_params
    #sets the paramaters you want to have included from form when displaying cocktail
        params.permit(:name, :base_spirit_id, :instructions)
    end
      
end
