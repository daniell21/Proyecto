class AccountreceivableImport
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
    if imported_accountreceivables.map(&:valid?).all?
       imported_accountreceivables.each(&:save!)
      true
    else

      imported_accountreceivables.each_with_index do |accountreceivable, index|
      
        accountreceivable.errors.full_messages.each do |message|
          errors.add :base, "linea #{index+2}: #{message}"
        end
      end
      false 
    end
  end

  def imported_accountreceivables
    @imported_accountreceivables ||= load_imported_accountreceivables
  end
  #validar si no existe un cliente o una tarifa
def load_imported_accountreceivables
    spreadsheet = open_spreadsheet
    header = spreadsheet.row(1)
    
    (2..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      accountreceivable = Accountreceivable.find_by profitNUmber: row["numeroProfit"]
      accountreceivable =  Accountreceivable.new if (Accountreceivable.find_by profitNUmber: row["numeroProfit"]).nil?

      client = Client.find_by rif: row["rifCliente"]
      client = Client.new if (Client.find_by rif: row["rifCliente"]).nil?
      
      rate = Rate.find_by name: row["concepto"]
      rate = Rate.new if (Rate.find_by name: row["concepto"]).nil?
      if row["facturaPagada"] == "Si"
        accountreceivable.paid  = true
      else
        accountreceivable.paid  = false
      end
      #accountreceivable.attributes = row.to_hash.slice(*row.to_hash.keys)
      accountreceivable.client_id = client.id
      accountreceivable.rate_id = rate.id
      accountreceivable.profitNumber = row["numeroProfit"]
      accountreceivable.profitCode = row["codigoProfit"]
      accountreceivable.date = row["fecha"]
      accountreceivable.status = row["estado"]
      accountreceivable.paymentType = row["tipoPago"]
      accountreceivable.amountPaid = row["montoPagado"]
      accountreceivable.bank = row["banco"]
      accountreceivable.month = row["mes"]
      accountreceivable.paymentComment = row["comentarioPago"]
      accountreceivable
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

