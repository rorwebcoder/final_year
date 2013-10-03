require "date"
require 'open-uri'
class Media < ActiveRecord::Base
		attr_accessible :document
		
		# Attachment handler : Paperclip
		has_attached_file :document
		validates_attachment :document, content_type: { content_type: "application/pdf" }
		validates :document_file_name, uniqueness: true, presence: true
		
		# Associations
		belongs_to :user
		
		def error_message(field_name)
				h = {:document_file_name => "Select any file.", :document_content_type => "Select any PDF file."}
				h[field_name]
		end
		
		def extract_events
				io     = open(full_url)
				reader = PDF::Reader.new(io)
				
				reader.pages.each do |page|
						extract_each_page(page.text)
				end
				
				mark_as_processed
		end
		
		def mark_as_processed
				self.is_processed = true
				self.save
		end
		
		def full_url
				(Rails.env == "development") ? "http://localhost:3000#{self.document.url}".split("?")[0] : ""
		end
		
		def extract_each_page(page_content)
				events = []
				page_content.gsub("\n\n","\n").gsub(/\n\s+/,"").split("\n").each do |d|
						if d.split(" ").length > 4
								events << d
						end
				end

				months = %w(january february march april may june july august september october november december)
				@month = ""
				events.each_with_index do |e, i|
						if i == 0
								months.each do |m|
										@month = m if e.downcase.include?(m)
								end
								@year = e.split(@month.capitalize)[1].split("Slno")[0].to_i
						else
								d = DateTime.new(@year,(months.index(@month)+1),e.split(" ")[1].to_i)
								Event.create(:title => "#{@month}-#{@year}-events", :description => e, :start_date => d, :end_date => d)
						end
				end
		end
end
