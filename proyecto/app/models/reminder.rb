class Reminder < ApplicationRecord
	validates :name, presence: true
	validates :frecuency, presence: true
end
