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
    # @cocktail = Cocktail.find(params[:id])
  end

  # GET /cocktails/new
  def new
    @cocktail = Cocktail.new
  end

  # GET /cocktails/1/edit
  def edit
  end

  # POST /cocktails
  # POST /cocktails.json
  def create
    @cocktail = current_user.cocktails.build(cocktail_params)
    if @cocktail.save
      flash[:success] = "cocktail stored in barbot database"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  # PATCH/PUT /cocktails/1
  # PATCH/PUT /cocktails/1.json
  def update
    respond_to do |format|
      if @cocktail.update(cocktail_params)
        format.html { redirect_to @cocktail, notice: 'Cocktail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cocktail.errors, status: :unprocessable_entity }
      end
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
      params.require(:cocktail).permit(:name, :description, :rating)
    end

    def correct_user
      @cocktail = current_user.cocktails.find_by(id: params[:id])
      redirect_to root_url if @cocktail.nil?
    end
end
