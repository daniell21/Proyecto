class ClientImportsController < ApplicationController
  before_action :set_client_import, only: [:show, :edit, :update, :destroy]


  # GET /client_imports/new
  def new
    @client_import = ClientImport.new
  end

  # POST /client_imports
  # POST /client_imports.json
  def create
    @client_import = ClientImport.new(client_import_params)

    respond_to do |format|
      if @client_import.save
        format.html { redirect_to clients_path, notice: 'Los Clientes fueron importados correctamente.' }
        format.json { render :show, status: :created, location: clients_path }
      else
        format.html { render :new }
        format.json { render json: @client_import.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_import
      @client_import = ClientImport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_import_params
      params.fetch(:client_import, {})
    end
end



