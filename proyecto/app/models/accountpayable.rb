class Accountpayable < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper
  belongs_to :supplier
  validates :descripcion, presence: true #uniqueness: true
  validates :amountPaid, presence: true
  validates :date, presence: true
  validates :supplier, presence: true
  before_save :validateAmountPaid
  validates :profitNumber, presence: true, length: { minimum: 6 }, uniqueness: true
  validates_numericality_of :profitNumber
  

def validateAmountPaid
    if amountPaid
      amount = amountPaid.to_s.gsub(',', '.').to_f
      self.amountPaid = ActionController::Base.helpers.number_with_precision(amount, :precision => 2)
     
    end

  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |accountpayable|
        csv << accountpayable.attributes.values_at(*column_names)
      end
    end
  end
  def self.import(file)
   spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      accountpayable = find_by(profitNUmber: row["numeroProfit"].to_i.to_s) || new
      accountpayable.profitNumber = row["numeroProfit"]
      accountpayable.date = row["fecha"]
      supplier = Supplier.find_by rif: row["rifProveedor"]
      accountpayable.supplier_id = supplier.id
      accountpayable.descripcion = row["descripcion"]
      accountpayable.amountPaid = row["montoPagado"]
      accountpayable.comment = row["comentario"]
      #supplier.attributes = row.to_hash.slice(*row.to_hash.keys)
      accountpayable.save! 
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



#validates :username, format: { with: /regex/ }

#simple search total
def self.search(search)
  if search
  where('total LIKE ?', "%#{search}%")
  else
    all
  end
end
private

  def helper
    @helper ||= Class.new do
      include ActionView::Helpers::NumberHelper
    end.new
  end

end

