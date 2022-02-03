class CocktailsController < ApplicationController
    # skip_before_action :verify_authenticity_token #vulnerable to cross site foragry
    before_action :set_cocktail, only: [:show, :update, :destroy, :edit]
    before_action :set_base_spirits, only: [:new, :edit]

    def index
        @cocktails = Cocktail.all
    end

    def new
        @cocktail = Cocktail.new
    end

    def edit
    
    end

    def create
        pp cocktail_params
       @cocktail = Cocktail.new(cocktail_params)
       if @cocktail.save
        redirect_to cocktails_path
       else
        set_base_spirits
        render "new", status: 422
       end
    end 

    def show

    end

    def update
       if @cocktail.update(cocktail_params)
        redirect_to cocktail_path(@cocktail.id)
    else
        set_base_spirits
        render "edit", status: 422
       end

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
        params.require(:cocktail).permit(:name, :base_spirit_id, :instructions)
    end
      
end
