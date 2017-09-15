class Client < ActiveRecord::Base
  #Relaciones
	has_many :accountreceivables, :dependent => :delete_all
  has_many :client_mails, :dependent => :delete_all
  has_many :emails, :dependent => :delete_all

  #Validaciones
  has_and_belongs_to_many :discounts
  validates :name, presence: true
  validates :country, presence: true 
  validates :socialReason, presence: true
  validates :state, presence: true
  validates :rif, presence: true, uniqueness: true , length: { minimum: 9 }
  validates :profitCode, presence: true, length: { minimum: 6 }, uniqueness: true
  validates :localAmount, presence: true




  #before_update :sp

  
  validates_numericality_of :rif
  validates_numericality_of :localAmount
  validates_numericality_of :profitCode
  validates_numericality_of :specialDiscount, :allow_blank => true
  #before_save :country_name

 
  
  #def validateDiscounts?
    #contador = 0
    #discounts.each do |discount|
      #contador = contador + 1
    #end
    #if contador == 2
      #return true
    

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |client|
        csv << client.attributes.values_at(*column_names)
      end
    end
  end
  
    
    def self.import(file)

      
   spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)

    (2..spreadsheet.last_row).each do |i|

      row = Hash[[header, spreadsheet.row(i)].transpose]
      client = find_by(rif: row["rif"].to_i.to_s) || new
      #client.attributes = row.to_hash.slice(*row.to_hash.keys)
      
      client.chargeMonthlyFee = ["cobrarMensualidad"]
      client.socialReason = row["razonSocial"]
      client.profitCode = row["codigoProfit"]
      client.localAmount = row["cantidadLocales"]
      client.name = row["nombre"]
      client.completeCountry = row["pais"]
      client.oldCustomer = row["clienteAntiguo"]
      client.rif = row["rif"]
      client.comment = row["comentario"]
      client.specialcontributor = row["contribuyenteEspecial"]
      client.state = row["estado"]
      #raise row["completeCountry"].to_yaml
      client.save!
    end
end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when '.csv' then Roo::Csv.new(file.path)
      when '.xls' then Roo::Excel.new(file.path)
      when '.xlsx' then Roo::Excelx.new(file.path)
    else
      raise "Unknown file type: #{file.original_filename}"
    end
  end
  #simple search name
 def self.search(search)
  if search
  where('name LIKE ?', "%#{search}%")
  else
    all
  end
end

   private
def calculateCode
  #self.total = Settings.monthlyPayment + retentioniva

  self.code = country + state + profitCode
  
end
  

   #def send_mail
    #ClientMailer.delay.new_client(self)
   #end
   def country_name

    country = ISO3166::Country[self.country]
    country.translations[I18n.locale.to_s] || country.name
    self.completeCountry = country
    
    if self.completeCountry == "Venezuela (Bolivarian Republic of)"
      
      self.completeCountry = "Venezuela"
      
    end
  end

end
