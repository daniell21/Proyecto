class SupplierImportsController < ApplicationController
  before_action :set_supplier_import, only: [:show, :edit, :update, :destroy]

  # GET /supplier_imports/new
  def new
    @supplier_import = SupplierImport.new
  end

  # POST /supplier_imports
  # POST /supplier_imports.json
  def create
    @supplier_import = SupplierImport.new(supplier_import_params)

    respond_to do |format|
      if @supplier_import.save
        format.html { redirect_to suppliers_path, notice: 'Supplier import was successfully created.' }
        format.json { render :show, status: :created, location: @supplier }
      else
        format.html { render :new }
        format.json { render json: @supplier_import.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier_import
      @supplier_import = SupplierImport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supplier_import_params
      params.fetch(:supplier_import, {})
    end
end
