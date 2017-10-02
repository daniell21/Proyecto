class ApiusersController < ApplicationController
  before_action :set_apiuser, only: [:show, :edit, :update, :destroy]

  # GET /apiusers
  # GET /apiusers.json
  def index
    @apiusers = Apiuser.all
  end

  # GET /apiusers/1
  # GET /apiusers/1.json
  def show
  end

  # GET /apiusers/new
  def new
    @apiuser = Apiuser.new
  end

  # GET /apiusers/1/edit
  def edit
  end

  # POST /apiusers
  # POST /apiusers.json
  def create
    @apiuser = Apiuser.new(apiuser_params)

    respond_to do |format|
      if @apiuser.save
        format.html { redirect_to @apiuser, notice: 'Apiuser was successfully created.' }
        format.json { render :show, status: :created, location: @apiuser }
      else
        format.html { render :new }
        format.json { render json: @apiuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apiusers/1
  # PATCH/PUT /apiusers/1.json
  def update
    respond_to do |format|
      if @apiuser.update(apiuser_params)
        format.html { redirect_to @apiuser, notice: 'Apiuser was successfully updated.' }
        format.json { render :show, status: :ok, location: @apiuser }
      else
        format.html { render :edit }
        format.json { render json: @apiuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apiusers/1
  # DELETE /apiusers/1.json
  def destroy
    @apiuser.destroy
    respond_to do |format|
      format.html { redirect_to apiusers_url, notice: 'Apiuser was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apiuser
      @apiuser = Apiuser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apiuser_params
      params.require(:apiuser).permit(:email, :password)
    end
end
