class Reminder < ActiveRecord::Base
	validates :name, presence: true
	validates :frecuency, presence: true
end
