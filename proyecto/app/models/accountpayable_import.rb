class AccountpayableImport
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
    if (file.nil?) 
    else
      if imported_accountpayables.map(&:valid?).all?
        imported_accountpayables.each(&:save!)
        true
      else

        imported_accountpayables.each_with_index do |accountpayable, index|
       
          accountpayable.errors.full_messages.each do |message|
            errors.add :base, "linea #{index+2}: #{message}"
          end
        end
        false
      end
    end
  end

  def imported_accountpayables
    if (file.nil?) 
    else
      @imported_accountpayables ||= load_imported_accountpayables
    end
  end
  


def load_imported_accountpayables
   spreadsheet = open_spreadsheet
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      accountpayable = Accountpayable.find_by profitNUmber: row["numeroProfit"]
      accountpayable =  Accountpayable.new if (Accountpayable.find_by profitNUmber: row["numeroProfit"]).nil?
    
      accountpayable.profitNumber = row["numeroProfit"]
      accountpayable.date = row["fecha"]
      supplier = Supplier.find_by rif: row["rifProveedor"]
      supplier = Supplier.new if (supplier = Supplier.find_by rif: row["rifProveedor"]).nil?

      accountpayable.supplier_id = supplier.id

      accountpayable.descripcion = row["descripcion"]
      accountpayable.amountPaid = row["montoPagado"]
      accountpayable.comment = row["comentario"]
      #supplier.attributes = row.to_hash.slice(*row.to_hash.keys)
      accountpayable
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

