class ExposuresController < ApplicationController
  before_action :set_exposure, only: [:show]

  # GET /exposures
  def index
    render json: Exposure.ruby_true
  end

  # GET /exposures/1
  def show
    render json: @exposure
  end

  # GET /exposures/recent_count
  def recent_count
    render json: Exposure.recent.count
  end

  # GET /exposure/recent_index
  def recent_index
    render json: Exposure.recent
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exposure
      @exposure = Exposure.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def exposure_params
      params.require(:exposure).permit(
        :summary,
        :published,
        :cvss_severity,
        :title,
        :cvss_v2_base_score,
        :impact_subscore,
        :exploitability_subscore,
        :access_vector,
        :access_complexity,
        :authentication,
        :impact_type,
        :external_source_organization,
        :external_source_name,
        :external_source_link)
    end
end
