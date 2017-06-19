class Client < ActiveRecord::Base
	has_many :accountreceivables, :dependent => :delete_all
  has_many :clientmails
  has_many :has_discounts
  has_many :discounts, through: :has_discounts
    validates :name, presence: true #uniqueness: true
    validates :lastname, presence: true #length: {minimum: 20}
    validates :email, uniqueness: true
   #validates :username, format: { with: /regex/ }
   after_create :send_mail
   #after_create :save_discounts
#custon setter
  def discounts=(value)
     @discounts = value
  end
    
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
   private
   def save_discounts
     @discounts.each do |discount_id|
       HasDiscount.create(discount_id: discount_id, client_id: self.id ) 
     end
  end
   def send_mail
   	ClientMailer.delay.new_client(self)
   end

end
