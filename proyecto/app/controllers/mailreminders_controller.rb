class MailremindersController < ApplicationController
  before_action :set_mailreminder, only: [:show, :edit, :update, :destroy]

  # GET /mailreminders
  # GET /mailreminders.json
  def index
    @mailreminders = Mailreminder.all
  end

  # GET /mailreminders/1
  # GET /mailreminders/1.json
  def show
  end

  # GET /mailreminders/new
  def new
    @mailreminder = Mailreminder.new
  end

  # GET /mailreminders/1/edit
  def edit
  end

  # POST /mailreminders
  # POST /mailreminders.json
  def create
    @mailreminder = Mailreminder.new(mailreminder_params)

    respond_to do |format|
      if @mailreminder.save
        format.html { redirect_to @mailreminder}
        format.json { render :show, status: :created, location: @mailreminder }
      else
        format.html { render :new }
        format.json { render json: @mailreminder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mailreminders/1
  # PATCH/PUT /mailreminders/1.json
  def update
    respond_to do |format|
      if @mailreminder.update(mailreminder_params)
        format.html { redirect_to @mailreminder}
        format.json { render :show, status: :ok, location: @mailreminder }
      else
        format.html { render :edit }
        format.json { render json: @mailreminder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mailreminders/1
  # DELETE /mailreminders/1.json
  def destroy
    @mailreminder.destroy
    respond_to do |format|
      format.html { redirect_to mailreminders_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mailreminder
      @mailreminder = Mailreminder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mailreminder_params
      params.require(:mailreminder).permit(:title, :body)
    end
end
