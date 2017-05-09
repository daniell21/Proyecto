class ClientmailsController < ApplicationController
  before_action :set_clientmail, only: [:show, :edit, :update, :destroy]
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /clientmails
  # GET /clientmails.json
  def index
    @clientmails = Clientmail.all
  end

  # GET /clientmails/1
  # GET /clientmails/1.json
  def show
  end

  # GET /clientmails/new
  def new
    @clientmail = Clientmail.new
  end

  # GET /clientmails/1/edit
  def edit
  end

  # POST /clientmails
  # POST /clientmails.json
    def create
    @client = Client.find(params[:client_id])
    @clientmail = @client.clientmails.create(clientmail_params)

    respond_to do |format|
      if @clientmail.save
        format.html { redirect_to client_path(@client), notice: 'Client Mail was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: clientmail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clientmails/1
  # PATCH/PUT /clientmails/1.json
  def update
    respond_to do |format|
      if @clientmail.update(clientmail_params)
        format.html { redirect_to @clientmail.client, notice: 'Clientmail was successfully updated.' }
        format.json { render :show, status: :ok, location: @clientmail }
      else
        format.html { render :edit }
        format.json { render json: @clientmail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clientmails/1
  # DELETE /clientmails/1.json
  def destroy
    @clientmail.destroy
    respond_to do |format|
      format.html { redirect_to @client, notice: 'Clientmail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clientmail
      @clientmail = Clientmail.find(params[:id])
    end
    def set_client
      @client = Client.find(params[:client_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def clientmail_params
      params.require(:clientmail).permit(:title, :body, :client_id)
    end
end
