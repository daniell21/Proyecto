class Client < ActiveRecord::Base
	has_many :accountreceivables, :dependent => :delete_all
  has_many :client_mails, :dependent => :delete_all
  has_many :emails, :dependent => :delete_all
  has_and_belongs_to_many :discounts
  validates :name, presence: true #uniqueness: true
  validates :country, presence: true #length: {minimum: 20}
  validates :socialReason, presence: true
  validates_presence_of :name
  validates :state, presence: true
  validates :rif, presence: true, length: { minimum: 9 }
  validates :profitCode, presence: true, length: { minimum: 6 }, uniqueness: true
  validates :localAmount, presence: true
  validates :rif, uniqueness: true  
  before_save :calculateCode
  validates_numericality_of :rif
  
  validates_numericality_of :localAmount
  before_save :country_name
  before_save :validateLocalAmount
  before_save :validateRif
  before_save :validateSpecialDiscount
  before_save :validateProfitCode
    #validates :specialDiscount,  absence: true, if: :validateDiscounts?
   #validates :username, format: { with: /regex/ }
  
   

  #def validateDiscounts?
    #contador = 0
    #discounts.each do |discount|
      #contador = contador + 1
    #end
    #if contador == 2
      #return true
    #end
  #end

  def validateLocalAmount
    self.localAmount = localAmount.to_s.gsub(',', '.').to_i
  end
  def validateRif
    self.rif = rif.to_s.gsub(',', '.').to_i
  end
  def validateSpecialDiscount
    if specialDiscount 
      self.specialDiscount = specialDiscount.to_s.gsub(',', '.').to_i
      validates_numericality_of :specialDiscount, length: { maximun: 2 }
    end

  end
  def validateProfitCode
    self.profitCode = profitCode.to_s.gsub(',', '.').to_i
  end
    
    def self.import(file)
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
  self.code = country + state + profitCode.to_s.gsub(',', '.').to_i.to_s
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
