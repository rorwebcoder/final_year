module ApplicationHelper

		def time_display(date_time_obj)
				date_time_obj.strftime("%d:%m:%Y %H:%M")
		end

end
