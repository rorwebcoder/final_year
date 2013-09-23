class Event < ActiveRecord::Base
		attr_accessible :start_date, :end_date, :title, :description

		# Validations
		validates :title, presence: true
		validates :description, presence: true
		validates :start_date, presence: true
		validates :end_date, presence: true
		
		validate :start_should_be_lower
		
		def start_should_be_lower
				errors.add(:start_date, "Start date should be less than End date.") if self.start_date > self.end_date
		end
		
		def send_reminder_to_all
				error = false
				begin
						tm = TwilioManager.new
						users = User.where("role != 'admin'")
						users.each do |user|
								tm.send_sms(user.mobile_number, self.description)
								#~ puts "sending sms to #{user.mobile_number}. Content: #{self.description}"
						end
				rescue
						error = true
						puts "#{$!.inspect}"
				end
				
				if !error
						update_reminder_sent_status
				end
		end
		
		def update_reminder_sent_status
				self.is_invited = true
				self.save
		end
		
end
