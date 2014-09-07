class CvesController < ApplicationController
  before_action :set_cfe, only: [:show, :edit, :update, :destroy]

  # GET /cves
  def index
    @cves = Cve.all
  end

  # GET /cves/1
  def show
  end

  # GET /cves/new
  def new
    @cfe = Cve.new
  end

  # GET /cves/1/edit
  def edit
  end

  # POST /cves
  def create
    @cfe = Cve.new(cfe_params)

    if @cfe.save
      redirect_to @cfe, notice: 'Cve was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /cves/1
  def update
    if @cfe.update(cfe_params)
      redirect_to @cfe, notice: 'Cve was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /cves/1
  def destroy
    @cfe.destroy
    redirect_to cves_url, notice: 'Cve was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cfe
      @cfe = Cve.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cfe_params
      params.require(:cfe).permit(:summary, :published, :cvss_severity, :title, :cvss_v2_base_scroe, :impact_subscore, :exploitability_subscore, :access_vector, :access_complexity, :authentication, :impact_type, :web_link, :external_source_org, :external_source_name, :external_source_link)
    end
end
