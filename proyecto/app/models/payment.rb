class Payment < ActiveRecord::Base
	mount_uploader :proof, ProofUploader
	
end
