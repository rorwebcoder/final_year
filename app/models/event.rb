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
end
