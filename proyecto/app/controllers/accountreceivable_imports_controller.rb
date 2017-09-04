class AccountreceivableImportsController < ApplicationController
  before_action :set_accountreceivable_import, only: [:show, :edit, :update, :destroy]


  # GET /accountreceivable_imports/new
  def new
    @accountreceivable_import = AccountreceivableImport.new
  end

 

  # POST /accountreceivable_imports
  # POST /accountreceivable_imports.json
  def create
    @accountreceivable_import = AccountreceivableImport.new(accountreceivable_import_params)

    respond_to do |format|
      if @accountreceivable_import.save
        format.html { redirect_to accountreceivables_path, notice: 'Accountreceivable import was successfully created.' }
        format.json { render :show, status: :created, location:accounreceivables_path }
      else
        format.html { render :new }
        format.json { render json: @accountreceivable_import.errors, status: :unprocessable_entity }
      end
    end
  end

 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accountreceivable_import
      @accountreceivable_import = AccountreceivableImport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accountreceivable_import_params
      params.fetch(:accountreceivable_import, {})
    end
end



