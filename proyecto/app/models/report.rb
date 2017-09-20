class Report < ApplicationRecord
	validates_presence_of :title
mount_uploader :chart, ChartUploader
end
