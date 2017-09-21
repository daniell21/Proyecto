class Report < ActiveRecord::Base
	validates_presence_of :title
mount_uploader :chart, ChartUploader
end
