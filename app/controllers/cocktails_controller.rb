class CocktailsController < ApplicationController
  before_action :set_cocktail, only:[:show, :edit, :update, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @doses = @cocktail.doses
    @ingredients = Ingredient.all
    @ingredient_recipe = []
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save!
      redirect_to cocktails_path
    else
      render 'new'
    end
  end

  def edit
    @doses = @cocktail.doses
    @ingredients = Ingredient.all
  end

  def update
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end