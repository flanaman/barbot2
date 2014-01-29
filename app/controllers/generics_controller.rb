class GenericsController < ApplicationController
  before_action :set_generic, only: [:show, :edit, :update, :destroy]

  # GET /generics
  # GET /generics.json
  def index
    @generics = Generic.all
  end

  # GET /generics/1
  # GET /generics/1.json
  def show
  end

  # GET /generics/new
  def new
    @generic = Generic.new
  end

  # GET /generics/1/edit
  def edit
  end

  # POST /generics
  # POST /generics.json
  def create
    @generic = Generic.new(generic_params)

    respond_to do |format|
      if @generic.save
        format.html { redirect_to @generic, notice: 'Generic was successfully created.' }
        format.json { render action: 'show', status: :created, location: @generic }
      else
        format.html { render action: 'new' }
        format.json { render json: @generic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /generics/1
  # PATCH/PUT /generics/1.json
  def update
    respond_to do |format|
      if @generic.update(generic_params)
        format.html { redirect_to @generic, notice: 'Generic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @generic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /generics/1
  # DELETE /generics/1.json
  def destroy
    @generic.destroy
    respond_to do |format|
      format.html { redirect_to generics_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_generic
      @generic = Generic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def generic_params
      params.require(:generic).permit(:name, :proof, :category)
    end
end
