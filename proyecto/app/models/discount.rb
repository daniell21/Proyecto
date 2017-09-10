class Discount < ActiveRecord::Base
	 has_and_belongs_to_many :clients
	 validates :name, presence: true
	 validates :percentage, presence: true
	 validates_numericality_of :percentage
	 #simple search name
	 before_save :validatePercentage
def validatePercentage
	raise percentage.to_s.to_yaml
    per = percentage.to_s.gsub(',', '.').to_f
    self.percentage = ActionController::Base.helpers.number_with_precision(per, :precision => 2)
    
  end
	 def self.search(search)
  if search
  where('name LIKE ?', "%#{search}%")
  else
    all
  end
end
end
