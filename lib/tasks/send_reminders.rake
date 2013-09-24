desc "Fetch tomorrow's events and send reminder to all attendees"
task :send_reminders => :environment do
		d = Date.today + 1
		d.to_datetime.change(:offset => "IST")
		start_d = d.beginning_of_day
		end_d = d.end_of_day
		events = Event.where(["start_date >= :start_d and start_date <= :end_d", {start_d: start_d, end_d: end_d}])
		events.each do |e|
				e.send_reminder_to_all
		end
end