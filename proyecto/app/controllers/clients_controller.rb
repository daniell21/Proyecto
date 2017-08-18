class ClientsController < ApplicationController
   load_and_authorize_resource 
   skip_load_and_authorize_resource
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
 helper_method :sort_column, :sort_diection

  # GET /clients
  # GET /clients.json
  def index
    #obtiene todos los registros de la tabla client
    #cambiar el 5 por el numero de elementos por pagiba
    @clients = Client.order(sort_column + " " + sort_diection).search(params[:search]).paginate(:per_page => 30, :page => params[:page])
    

    respond_to do |format|
    format.html
    format.json
    format.pdf {render template: 'clients/reporte', pdf: 'Reporte'}
    end
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    #encontrar un registro por su id
    @accountreceivable = Accountreceivable.new
    @email = Email.new
    #@clientmail = Clientmail.new
  end

  # GET /clients/new
 def new
    @client = Client.new
    @discounts = Discount.all
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)
    

    respond_to do |format|
      if @client.save

        format.html { redirect_to @client}#, notice: 'Client was successfully created.' 
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    params[:client][:discount_ids] ||=[]
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client}
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url}
      format.json { head :no_content }
    end
  end
  def import
    Client.import(params[:file])
    redirect_to clients_path, notice: "Clientes importados correctamente."
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit!
    end
    def sort_column
      Client.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_diection
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end