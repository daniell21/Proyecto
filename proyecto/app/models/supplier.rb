class Supplier < ActiveRecord::Base
	has_many :accountpayables, :dependent => :delete_all
	validates :name, presence: true #uniqueness: true
  validates :email, presence: true #length: {minimum: 20}
  validates :rif, presence: true, length: { minimum: 9 }
  validates :rif, uniqueness: true 
  validates_numericality_of :rif
  validates :socialReason, presence: true
  validates :address, presence: true
  validates :email, uniqueness: true
  before_save :validateRif
  

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |supplier|
        csv << supplier.attributes.values_at(*column_names)
      end
    end
  end
  def validateRif
    self.rif = rif.to_s.gsub(',', '.').to_i
  end
   #validates :username, format: { with: /regex/ }
   def self.import(file)
   spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      supplier = find_by_id(row["id"]) || new
      supplier.attributes = row.to_hash.slice(*row.to_hash.keys)
      supplier.save!
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
end
