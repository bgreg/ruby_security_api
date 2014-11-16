class ExposuresController < ApplicationController
  before_action :set_exposure, only: [:show]


  # GET /exposures
  def index
    render json: {
      recents: Exposure.ruby_true.recent.map{|e| {
        name:          e[:title], 
        id:            e[:id],
        cve_id:        e[:cve_id],
        cvss_severity: e[:cvss_severity]} },
      others:  Exposure.ruby_true.others.map{|e| {
        name:        e[:title], 
        id:          e[:id], 
        cve_id:      e[:cve_id],
        cvss_severity: e[:cvss_severity] } } 
    }
  end

  # GET /exposures/1
  def show
    render json: @exposure
  end

  # GET /exposures/recent_count
  def recent_count
    render json: {count: Exposure.recent.count.to_s}
  end

  # GET /exposure/recent_index
  def recent_index
    render json: Exposure.recent.collect{|e| {name: e[:title], id: e[:id]} }
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
