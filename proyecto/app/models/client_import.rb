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

    unless (file.nil?) 
      if @p.nil?
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
    unless (file.nil?)
     
      @imported_clients ||= load_imported_clients
    end
   
  end
  


def load_imported_clients
   spreadsheet = open_spreadsheet
   @p = spreadsheet
   
   unless @p.nil?
      
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).map do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
         
        client = Client.find_by rif: row["rif"] 
        client =  Client.new if (Client.find_by rif: row["rif"]).nil?
        
        #client.attributes = row.to_hash.slice(*row.to_hash.keys)
        
        if (row["cobrarMensualidad"] == "Si")
          cobrar =  true
        else 
          cobrar = false
        end
        if (row["contribuyenteEspecial"] == "Si")
          contribuyente =  true
        else 
          contribuyente = false
        end
        client.chargeMonthlyFee = cobrar
        client.socialReason = row["razonSocial"]
        client.profitCode = row["codigoProfit"]
        client.localAmount = row["cantidadLocales"]
        client.name = row["nombre"]
        client.country = row["pais"]
        client.rif = row["rif"]
        client.comment = row["comentario"]
        client.specialcontributor = contribuyente
        client.state = row["estado"]
        client.localId = row["localId"]
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

