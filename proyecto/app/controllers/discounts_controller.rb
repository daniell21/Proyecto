class DiscountsController < ApplicationController
  before_action :set_discount, only: [:show, :edit, :update, :destroy]

  # GET /discounts
  # GET /discounts.json
  helper_method :sort_column, :sort_diection
  def index
    @discounts = Discount.search(params[:search]).order(sort_column + " " + sort_diection).paginate(:per_page => 5, :page => params[:page])
  end

  # GET /discounts/1
  # GET /discounts/1.json
  def show
  end

  # GET /discounts/new
  def new
    @discount = Discount.new
  end 
  # GET /discounts/1/edit
  def edit
  end

  # POST /discounts
  # POST /discounts.json
  def create
    discount_params[:percentage].to_s.gsub!(',', '.')
    @discount = Discount.new(discount_params)

    respond_to do |format|
      if @discount.save
        format.html { redirect_to @discount, notice: 'El Descuento fue Creado Exitosamente.'}
        format.json { render :show, status: :created, location: @discount }
      else
        format.html { render :new }
        format.json { render json: @discount.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /discounts/1
  # PATCH/PUT /discounts/1.json
  def update
    respond_to do |format|
      discount_params[:percentage].to_s.gsub!(',', '.')
      if @discount.update(discount_params)
        format.html { redirect_to @discount, notice: 'El Descuento fue Actualizado Exitosamente.'}
        format.json { render :show, status: :ok, location: @discount }
      else
        format.html { render :edit }
        format.json { render json: @discount.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discounts/1
  # DELETE /discounts/1.json
  def destroy
    @discount.destroy
    respond_to do |format|
      format.html { redirect_to discounts_url, notice: 'El Descuento fue Eliminado Exitosamente.'}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discount
      @discount = Discount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discount_params
      params.require(:discount).permit(:name, :percentage)
    end
    def sort_column
      Discount.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_diection
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
