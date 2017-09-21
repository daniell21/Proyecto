class UsersController < ApplicationController
	load_and_authorize_resource 
   skip_load_and_authorize_resource
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_diection

  # GET /accountreceivables
  # GET /accountreceivables.json
  def index
    @users = User.order(sort_column + " " + sort_diection).search(params[:search]).paginate(:per_page => 20, :page => params[:page])

  end

  # GET /accountreceivables/1
  # GET /accountreceivables/1.json
  def show
  end

  # GET /accountreceivables/new
  def new
    @user = User.new
  end

  # GET /accountreceivables/1/edit
  def edit
  end

  # POST /accountreceivables
  # POST /accountreceivables.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_url, notice: 'El Usuario fue Creado Exitosamente.'}
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accountreceivables/1
  # PATCH/PUT /accountreceivables/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_url, notice: 'El Usuario fue Actualizado Exitosamente.'}
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accountreceivables/1
  # DELETE /accountreceivables/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'El Usuario fue Eliminado Exitosamente.'}
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:client_id, :email, :role)
    end
    def sort_column
      User.column_names.include?(params[:sort]) ? params[:sort] : "email"
    end

    def sort_diection
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
