class RemindersController < ApplicationController
  load_and_authorize_resource 
  skip_load_and_authorize_resource
  before_action :set_reminder, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_diection

  # GET /reminders
  # GET /reminders.json
  def index
    @reminders = Reminder.order(sort_column + " " + sort_diection)
  end

  # GET /reminders/1
  # GET /reminders/1.json
  def show
  end
 
  # GET /reminders/new
  def new
    @reminder = Reminder.new
  end

  # GET /reminders/1/edit
  def edit
  end

  # POST /reminders
  # POST /reminders.json
  def create
    @reminder = Reminder.new(reminder_params)

    respond_to do |format|
      if @reminder.save
        format.html { redirect_to @reminder, notice: 'El Recordatorio fue Creado Exitosamente.' }
        format.json { render :show, status: :created, location: @reminder }
      else
        format.html { render :new }
        format.json { render json: @reminder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reminders/1
  # PATCH/PUT /reminders/1.json
  def update
    respond_to do |format|
      if @reminder.update(reminder_params)
        format.html { redirect_to @reminder, notice: 'El Recordatorio fue Actualizado Exitosamente.' }
        format.json { render :show, status: :ok, location: @reminder }
      else
        format.html { render :edit }
        format.json { render json: @reminder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reminders/1
  # DELETE /reminders/1.json
  def destroy
    @reminder.destroy
    respond_to do |format|
      format.html { redirect_to reminders_url, notice: 'El Recordatorio fue Eliminado Exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reminder
      @reminder = Reminder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reminder_params
      params.require(:reminder).permit(:name, :frecuency)
    end
    def sort_column
      Reminder.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_diection
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end 
end
