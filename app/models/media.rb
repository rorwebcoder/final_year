class Media < ActiveRecord::Base
		attr_accessible :document
		
		# Attachment handler : Paperclip
		has_attached_file :document
		validates_attachment :document, content_type: { content_type: "application/pdf" }
		
		# Associations
		belongs_to :user
end
