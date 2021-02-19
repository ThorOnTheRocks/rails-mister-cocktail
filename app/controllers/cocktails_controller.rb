class CocktailsController < ApplicationController
	def home

	end

	def index
		@cocktails = Cocktail.all
	end

	def show
		@cocktail = Cocktail.find(params[:id])
	end

	def new
		@cocktail = Cocktail.new
	end

	def create
		@cocktail = Cocktail.new(params_cocktail)

		if @cocktail.save
			redirect_to cocktail_path(@cocktail), notice: 'Cocktail created successfully.'
		else
			render :new
		end
		
	end

	private

	def params_cocktail
		params.require(:cocktail).permit(:name, :img_url)
	end
end