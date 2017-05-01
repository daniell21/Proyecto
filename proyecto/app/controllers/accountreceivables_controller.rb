class AccountreceivablesController < ApplicationController
  before_action :set_accountreceivable, only: [:show, :edit, :update, :destroy]
  before_action :set_client
  before_action :authenticate_user!

  # GET /accountreceivables
  # GET /accountreceivables.json
  def index
    @accountreceivables = Accountreceivable.all
  end

  # GET /accountreceivables/1
  # GET /accountreceivables/1.json
  def show
  end

  # GET /accountreceivables/new
  def new
    @accountreceivable = Accountreceivable.new
  end

  # GET /accountreceivables/1/edit
  def edit
  end

  # POST /accountreceivables
  # POST /accountreceivables.json
  def create
    @accountreceivable = Accountreceivable.new(accountreceivable_params)
    @accountreceivable.client = @client
    respond_to do |format|
      if @accountreceivable.save
        format.html { redirect_to @accountreceivable.client, notice: 'Accountreceivable was successfully created.' }
        format.json { render :show, status: :created, location: @accountreceivable }
      else
        format.html { render :new }
        format.json { render json: @accountreceivable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accountreceivables/1
  # PATCH/PUT /accountreceivables/1.json
  def update
    respond_to do |format|
      if @accountreceivable.update(accountreceivable_params)
        format.html { redirect_to @accountreceivable.client, notice: 'Accountreceivable was successfully updated.' }
        format.json { render :show, status: :ok, location: @accountreceivable }
      else
        format.html { render :edit }
        format.json { render json: @accountreceivable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accountreceivables/1
  # DELETE /accountreceivables/1.json
  def destroy
    @accountreceivable.destroy
    respond_to do |format|
      format.html { redirect_to @client, notice: 'Accountreceivable was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_client
      @client = Client.find(params[:client_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_accountreceivable
      @accountreceivable = Accountreceivable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accountreceivable_params
      params.require(:accountreceivable).permit(:client_id, :descripcion, :total)
    end
end
