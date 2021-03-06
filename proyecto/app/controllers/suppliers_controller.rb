class SuppliersController < ApplicationController
  load_and_authorize_resource 
   skip_load_and_authorize_resource
  before_action :set_supplier, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_diection
  # GET /suppliers
  # GET /suppliers.json
  def index
    #@suppliers = Supplier.all
    @suppliers =  Supplier.order(sort_column + " " + sort_diection).order(:name).search(params[:search])
    respond_to do |format|
    format.html
    format.json
    format.csv { send_data @suppliers.to_csv }
      format.xls 
    format.pdf {render template: 'suppliers/reporte', pdf: 'Proveedores', layout: 'pdf.html'}
    end
  end

  # GET /suppliers/1
  # GET /suppliers/1.json
  def show
  end

  # GET /suppliers/new
  def new
    @supplier = Supplier.new
  end

  # GET /suppliers/1/edit
  def edit
  end

  # POST /suppliers
  # POST /suppliers.json
  def create
    @supplier = Supplier.new(supplier_params) 
   
  
    respond_to do |format|
      if @supplier.save
        format.html { redirect_to @supplier, notice: 'El Proveedor fue Creado Exitosamente.' }
        format.json { render :show, status: :created, location: @supplier }
      else
        format.html { render :new }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suppliers/1
  # PATCH/PUT /suppliers/1.json
  def update
    #params[:supplier][:top_ids] ||=[]
    respond_to do |format|
      if @supplier.update(supplier_params)
        format.html { redirect_to @supplier, notice: 'El Proveedor fue Actualizado Exitosamente.'}
        format.json { render :show, status: :ok, location: @supplier }
      else
        format.html { render :edit }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suppliers/1
  # DELETE /suppliers/1.json
  def destroy
    @supplier.destroy
    respond_to do |format|
      format.html { redirect_to suppliers_url, notice: 'El Proveedor fue Eliminado Exitosamente.'}
      format.json { head :no_content }
    end
  end
  def import
    if ((params[:file]).nil?) == false
      
        Supplier.import(params[:file])
        redirect_to suppliers_path, notice: "Proveedores importados correctamente."
      else 
        redirect_to suppliers_path, notice: "No ha seleccionado ningún archivo"
      end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supplier_params
      params.require(:supplier).permit!
    end
    def sort_column
      Supplier.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_diection
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
