class Client < ActiveRecord::Base
	has_many :accountreceivables, :dependent => :delete_all
    validates :name, presence: true #uniqueness: true
    validates :lastname, presence: true #length: {minimum: 20}
   #validates :username, format: { with: /regex/ }
   after_create :send_mail

  
    
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
   def send_mail
   	ClientMailer.new_client(self).deliver_later
   end

end
