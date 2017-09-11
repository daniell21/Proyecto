class Reminder < ActiveRecord::Base
	validates :frecuency, presence: true
end
