class ToptensController < ApplicationController
  before_action :set_topten, only: [:show, :edit, :update, :destroy]

  # GET /toptens
  def index
    @toptens = Topten.all
  end

  # GET /toptens/1
  def show
  end

  # GET /toptens/new
  def new
    @topten = Topten.new
  end

  # GET /toptens/1/edit
  def edit
  end

  # POST /toptens
  def create
    @topten = Topten.new(topten_params)

    if @topten.save
      redirect_to @topten, notice: 'Topten was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /toptens/1
  def update
    if @topten.update(topten_params)
      redirect_to @topten, notice: 'Topten was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /toptens/1
  def destroy
    @topten.destroy
    redirect_to toptens_url, notice: 'Topten was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topten
      @topten = Topten.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def topten_params
      params.require(:topten).permit(:name, :comment, :address, :stars)
    end
end
