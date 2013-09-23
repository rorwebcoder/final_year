class TwilioManager
		
		attr_accessor :account_sid, :auth_token, :client
		
		def initialize
				@account_sid = 'ACd21df5222d9f42a487056fe6c38d4088'
				@auth_token = 'df37c36d65f2e60cfd01178cb1af8ea1'
				setup_client
		end
		
		def setup_client
				# set up a client to talk to the Twilio REST API
				@client = Twilio::REST::Client.new @account_sid, @auth_token
		end
		
		def send_sms(to_number, content)
				@client.account.sms.messages.create(
						:from => '+14844615423',
						:to => "+91#{to_number}",
						:body => content
				)
		end
		
end


#~ TwilioManager.new