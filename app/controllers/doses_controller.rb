class DosesController < ApplicationController
	before_action :set_cocktail, only: %i[new create]

	# GET /cocktails/:cocktail_id/doses/new
	def new
	  @dose = Dose.new
	end
  
	# POST /cocktails/:cocktail_id/doses
	def create
	  @dose = Dose.new(dose_params)
	  @dose.cocktail = @cocktail
  
	  if @dose.save
		redirect_to cocktail_path(@cocktail), notice: 'Ingredient created successfully.'
	  else
		render :new
	  end
	end
  
	# DELETE /doses/:id
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
