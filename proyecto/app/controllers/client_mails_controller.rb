class ClientMailsController < ApplicationController
  load_and_authorize_resource 
  skip_load_and_authorize_resource
  before_action :set_client_mail, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_diection

  # GET /client_mails
  # GET /client_mails.json
  def index
    @client_mails = ClientMail.order(sort_column + " " + sort_diection)
  end

  # GET /client_mails/1
  # GET /client_mails/1.json
  def show
  end

  # GET /client_mails/new
  def new
    @client_mail = ClientMail.new
  end 

  # GET /client_mails/1/edit
  def edit
  end

  # POST /client_mails
  # POST /client_mails.json
  def create
    @client_mail = ClientMail.new(client_mail_params)

    respond_to do |format|
      if @client_mail.save
        format.html { redirect_to @client_mail, notice: 'El Correo fue Enviado Exitosamente.'}
        format.json { render :show, status: :created, location: @client_mail }
      else
        format.html { render :new }
        format.json { render json: @client_mail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /client_mails/1
  # PATCH/PUT /client_mails/1.json
  def update
    respond_to do |format|
      if @client_mail.update(client_mail_params)
        format.html { redirect_to @client_mail, notice: 'El Correo fue Actualizado Exitosamente.'}
        format.json { render :show, status: :ok, location: @client_mail }
      else
        format.html { render :edit }
        format.json { render json: @client_mail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /client_mails/1
  # DELETE /client_mails/1.json
  def destroy
    @client_mail.destroy
    respond_to do |format|
      format.html { redirect_to client_mails_url, notice: 'El Correo fue Eliminado Exitosamente.'}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_mail
      @client_mail = ClientMail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_mail_params
      params.require(:client_mail).permit(:title, :body, :date, :client_id, :massMailings)
    end
    def sort_column
      ClientMail.column_names.include?(params[:sort]) ? params[:sort] : "title"
    end

    def sort_diection
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end 
end
