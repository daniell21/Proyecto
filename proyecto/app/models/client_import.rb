class ClientImport
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
    
   unless file.nil?
    unless @p.nil?
      raise 4.to_yaml
      if imported_clients.map(&:valid?).all?
        imported_clients.each(&:save!)
        true
      else
        imported_clients.each_with_index do |client, index|
          client.errors.full_messages.each do |message|
            errors.add :base, "linea #{index+2}: #{message}"
          end
        end
        false
      end
    end
 end
  end



  def imported_clients
    if (file.nil?)
      else
      @imported_clients ||= load_imported_clients
    end
   
  end
  

def load_imported_clients
   spreadsheet = open_spreadsheet
   @p = spreadsheet
   unless spreadsheet.nil?
    raise spreadsheet.nil?.to_yaml
      
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).map do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
         
        client = Client.find_by rif: row["rif"] 
        client =  Client.new if (Client.find_by rif: row["rif"]).nil?
        
        #client.attributes = row.to_hash.slice(*row.to_hash.keys)
        client.chargeMonthlyFee = row["cobrarMensualidad"]
        client.socialReason = row["razonSocial"]
        client.profitCode = row["codigoProfit"]
        client.localAmount = row["cantidadLocales"]
        client.name = row["nombre"]
        client.completeCountry = row["pais"]
        client.rif = row["rif"]
        client.comment = row["comentario"]
        client.specialcontributor = row["contribuyenteEspecial"]
        client.state = row["estado"]
        #raise row["completeCountry"].to_yaml
        client
      end
    end
end



def open_spreadsheet
  

    case File.extname(file.original_filename)
      when '.csv' then Roo::Csv.new(file.path)
      when '.xls' then Roo::Excel.new(file.path)
      when '.xlsx' then Roo::Excelx.new(file.path)
    else
      #raise "Unknown file type: #{file.original_filename}"
    end
    
  end
 end

