class AccountpayablesController < ApplicationController
  load_and_authorize_resource 
   skip_load_and_authorize_resource
  before_action :set_accountpayable, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_diection
  # GET /accountpayables
  # GET /accountpayables.json
  def index
    @accountpayables = Accountpayable.order(sort_column + " " + sort_diection).search(params[:search]).paginate(:per_page => 5, :page => params[:page])
  end

  # GET /accountpayables/1
  # GET /accountpayables/1.json
  def show
  end

  # GET /accountpayables/new
  def new
    @accountpayable = Accountpayable.new
  end

  # GET /accountpayables/1/edit
  def edit
  end

  # POST /accountpayables
  # POST /accountpayables.json
  def create
    @accountpayable = Accountpayable.new(accountpayable_params)

    respond_to do |format|
      if @accountpayable.save
        format.html { redirect_to @accountpayable}
        format.json { render :show, status: :created, location: @accountpayable }
      else
        format.html { render :new }
        format.json { render json: @accountpayable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accountpayables/1
  # PATCH/PUT /accountpayables/1.json
  def update
    respond_to do |format|
      if @accountpayable.update(accountpayable_params)
        format.html { redirect_to @accountpayable}
        format.json { render :show, status: :ok, location: @accountpayable }
      else
        format.html { render :edit }
        format.json { render json: @accountpayable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accountpayables/1
  # DELETE /accountpayables/1.json
  def destroy
    @accountpayable.destroy
    respond_to do |format|
      format.html { redirect_to accountpayables_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accountpayable
      @accountpayable = Accountpayable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accountpayable_params
      params.require(:accountpayable).permit(:descripcion, :total, :supplier_id)
    end
    def sort_column
      Accountpayable.column_names.include?(params[:sort]) ? params[:sort] : "total"
    end

    def sort_diection
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
