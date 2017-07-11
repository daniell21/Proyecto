class Accountreceivable < ActiveRecord::Base
  belongs_to :client
  before_create :calculate

#validates :username, format: { with: /regex/ }

private
def calculate
	print Accountreceivable.find(1)
	print "HE CALCULADOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
end

end
