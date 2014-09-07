class ExposuresController < ApplicationController
  before_action :set_exposure, only: [:show, :edit, :update, :destroy]

  # GET /exposures
  def index
    @exposures = Exposure.all
  end

  # GET /exposures/1
  def show
  end

  # GET /exposures/new
  def new
    @exposure = Exposure.new
  end

  # GET /exposures/1/edit
  def edit
  end

  # POST /exposures
  def create
    @exposure = Exposure.new(exposure_params)

    if @exposure.save
      redirect_to @exposure, notice: 'Exposure was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /exposures/1
  def update
    if @exposure.update(exposure_params)
      redirect_to @exposure, notice: 'Exposure was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /exposures/1
  def destroy
    @exposure.destroy
    redirect_to exposures_url, notice: 'Exposure was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exposure
      @exposure = Exposure.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def exposure_params
      params.require(:exposure).permit(:summary, :published, :cvss_severity, :title, :cvss_v2_base_score, :impact_subscore, :exploitability_subscore, :access_vector, :access_complexity, :authentication, :impact_type, :web_link, :external_source_organization, :external_source_name, :external_source_link)
    end
end
