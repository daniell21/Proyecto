class ReportsController < ApplicationController
  load_and_authorize_resource 
  skip_load_and_authorize_resource
  before_action :set_report, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_diection

  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.order(sort_column + " " + sort_diection) 
    respond_to do |format|
    format.html
    format.json
   format.csv { send_data text: @clients.to_csv }
   format.xls
    format.pdf {render template: 'reports/reporte', pdf: 'Reporte', layout: 'pdf.html'}# header: { right: 'Página [page] de [topage]' }}
    end
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
  end

  # GET /reports/new
  def new
    @report = Report.new
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)

    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: 'El Reporte fue creado Exitosamente.' }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to @report, notice: 'El Reporte fue Actualizado Exitosamente.' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url, notice: 'El Reporte fue Eliminado Exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:title, :content, :chart)
    end
    def sort_column
      Report.column_names.include?(params[:sort]) ? params[:sort] : "title"
    end

    def sort_diection
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end 
end
