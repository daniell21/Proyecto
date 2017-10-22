class AccountpayableImportsController < ApplicationController
  before_action :set_accountpayable_import, only: [:show, :edit, :update, :destroy]

  # GET /accountpayable_imports/new
  def new
    @accountpayable_import = AccountpayableImport.new
  end


  # POST /accountpayable_imports
  # POST /accountpayable_imports.json
  def create
    @accountpayable_import = AccountpayableImport.new(accountpayable_import_params)

    respond_to do |format|
      if @accountpayable_import.save
        format.html { redirect_to accountpayables_path, notice: 'Las Cuentas fueron importadas Correctamente.' }
        format.json { render :show, status: :created, location: accountpayables_path }
      else
        format.html { render :new }
        format.json { render json: @accountpayable_import.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accountpayable_import
      @accountpayable_import = AccountpayableImport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accountpayable_import_params
      params.fetch(:accountpayable_import, {})
    end
end


