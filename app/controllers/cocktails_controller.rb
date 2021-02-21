class CocktailsController < ApplicationController
	def home
		@cocktails = Cocktail.all
	end

	def index
		if params[:query].present?
			@cocktails = Cocktail.where("name ILIKE ?", "%#{params[:query]}%")
		else
			@cocktails = Cocktail.all
		end
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
