class DosesController < ApplicationController
  # before_action :set_dose, only: [:new, :create]
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(cocktail: @cocktail, ingredient: Ingredient.new)
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new

  end

  def destroy
    # @dose = Dose.find(params[:id])
    # @dose.destroy
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)

  end
end
