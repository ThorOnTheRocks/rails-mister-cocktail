class DosesController < ApplicationController
	before_action :set_cocktail, only: %i[new create]

    def new
			@dose = Dose.new
      @cocktail = Cocktail.find(params[:cocktail_id])
    end

		def create
			@dose = Dose.new(dose_params)
			@cocktail = Cocktail.find(params[:cocktail_id])
			@dose.cocktail = @cocktail
			
			if @dose.save
				redirect_to cocktail_path(@cocktail), notice: 'Ingredient created successfully.'
			else
				render :new
			end

		end

		def destroy
			@dose = Dose.find(params[:id])
	
			if @dose.destroy
				redirect_to cocktail_path(@dose.cocktail), notice: 'Ingredient destroyed successfully.'
			else
				redirect_to cocktail_path(@dose.cocktail), alert: 'Could not delete the ingredient!'
			end
		end

		private

		def dose_params
			params.require(:dose).permit(:description, :ingredient_id)
		end

		def set_cocktail
			@cocktail = Cocktail.find(params[:cocktail_id])
		end

end

# def create
# 	@review = Review.new(review_params)
# 	@restaurant = Restaurant.find(params[:restaurant_id])
# 	@review.restaurant = @restaurant
# 	if @review.save
# 		redirect_to restaurant_path(@restaurant)
# 	else
# 		render :new
# 	end
# end
