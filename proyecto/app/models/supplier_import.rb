class SupplierImport
  # switch to ActiveModel::Model in Rails 4
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :file

  def initialize(attributes = {})
    attributes.each { |name, value| send("#{name}=", value) }
  end

  def persisted?
    false
  end

  def save
    unless (file.nil?) 
      if @p.nil?
        if imported_suppliers.map(&:valid?).all?
          imported_suppliers.each(&:save!)
          true
        else
          imported_suppliers.each_with_index do |supplier, index|
            supplier.errors.full_messages.each do |message|
              errors.add :base, "linea #{index+2}: #{message}"
            end
          end
          false
        end
      end
    end
  end

  def imported_suppliers
    if (file.nil?) 
    else
      @imported_suppliers ||= load_imported_suppliers
    end
  end
  
     def load_imported_suppliers
    spreadsheet = open_spreadsheet
    @p = spreadsheet
    unless @p.nil?
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).map do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        supplier = Supplier.find_by rif: row["rif"] 
        supplier =  Supplier.new if (Supplier.find_by rif: row["rif"]).nil?

        supplier.rif = row["rif"]
        supplier.name = row["nombre"]
        supplier.socialReason = row["razonSocial"]
        supplier.email = row["correo"]
        supplier.address = row["direccion"]
        supplier.comment = row["comentarios"]
        
        #supplier.attributes = row.to_hash.slice(*row.to_hash.keys)
        supplier
      end
    end
end

def open_spreadsheet
    case File.extname(file.original_filename)
      when '.csv' then Roo::Csv.new(file.path)
      when '.xls' then Roo::Excel.new(file.path)
      when '.xlsx' then Roo::Excelx.new(file.path)
    else
      raise "Unknown file type: #{file.original_filename}"
    end
  end
 end

