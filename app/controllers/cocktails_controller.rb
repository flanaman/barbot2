class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user#, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy


  # GET /cocktails
  # GET /cocktails.json
  def index
    @cocktails = Cocktail.all
  end

  # GET /cocktails/1
  # GET /cocktails/1.json
  def show
    @cocktail = Cocktail.find(params[:id])
  end

  # GET /cocktails/new
  def new
    @ingredients=Ingredient.all 
    @cocktail = Cocktail.new
    2.times { component = @cocktail.components.build }
  end

  # GET /cocktails/1/edit
  def edit
    @ingredients=Ingredient.all 
    # 2.times { component = @cocktail.components.build }
  end

  # POST /cocktails
  # POST /cocktails.json
  def create
    @cocktail = current_user.cocktails.build(cocktail_params)
    if @cocktail.save
      flash[:success] = "cocktail stored in barbot database"
      redirect_to user_path(current_user) if signed_in?
    else
      render 'new'
    end
  end

  # PATCH/PUT /cocktails/1
  # PATCH/PUT /cocktails/1.json
  def update
    if @cocktail.update_attributes(cocktail_params)
      flash[:success] = "barbot has completed processing your new information"
      redirect_to @cocktail
    else
      flash[:error] = "does not compute"
      render 'edit'
    end
  end

  # DELETE /cocktails/1
  # DELETE /cocktails/1.json
  def destroy
    @cocktail.destroy
    redirect_to root_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cocktail
      @cocktail = Cocktail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cocktail_params
      params.require(:cocktail).permit(:name, :description, :rating,
        components_attributes: [:id, :amount, :ingredient_id, 
          :_destroy])
    end

    def correct_user
      @cocktail = current_user.cocktails.find_by(id: params[:id])
      redirect_to root_url if @cocktail.nil? # should this be rerouted?
    end
end
