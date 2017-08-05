class Client < ActiveRecord::Base
	has_many :accountreceivables, :dependent => :delete_all
  has_many :client_mails
   has_and_belongs_to_many :discounts
    validates :name, presence: true #uniqueness: true
    validates :country, presence: true #length: {minimum: 20}
    validates :email, uniqueness: true, presence: true
    validates :socialReason, presence: true
    validates_presence_of :name
    validates :state, presence: true
    validates :rif, presence: true, length: { minimum: 8 }
    validates :profitCode, presence: true
    validates :rif, uniqueness: true
    before_save :calculateCode
    validates_numericality_of :rif
    before_save :country_name
   #validates :username, format: { with: /regex/ }
   #after_create :send_mail
  
   


    
    def self.import(file)
   spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      client = find_by_id(row["id"]) || new
      client.attributes = row.to_hash.slice(*row.to_hash.keys)
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
