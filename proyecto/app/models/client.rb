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
  

  
  validates_numericality_of :rif
  validates_numericality_of :localAmount
  validates_numericality_of :profitCode
  validates_numericality_of :specialDiscount
  before_save :country_name
  before_save :calculateCode 
 

  #def validateDiscounts?
    #contador = 0
    #discounts.each do |discount|
      #contador = contador + 1
    #end
    #if contador == 2
      #return true
    #end
  #end


  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |client|
        csv << client.attributes.values_at(*column_names)
      end
    end
  end
  
    
    def self.import(file)

      if file.to_s.length == 0
        raise (4+4).to_yaml
      end
   spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)

    (2..spreadsheet.last_row).each do |i|

      row = Hash[[header, spreadsheet.row(i)].transpose]
      
      client = find_by(profitCode: row["profitCode"].to_i.to_s) || new
      
      client.attributes = row.to_hash.slice(*row.to_hash.keys)
      client.chargeMonthlyFee = true
      client.socialReason = row["socialReason"]
      client.profitCode = row["profitCode"].to_i
      client.localAmount = row["localAmount"].to_i
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
