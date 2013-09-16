class Takeaway

	require 'twilio-ruby'


	ACCOUNT_SID = ENV["AC9bc8da8ea5863b67f0267af867efc24e"]
	AUTH_TOKEN = ENV["aefad98a07d327818905a6f4e934d6ba"]

	FROM_NUMBER = '442393162721'
	TO_NUMBER = '447736955684'

	DISHES = {
		"Fried Rice" => 3.5,
		"Aromatic Duck" => 12,
		"Thai Calamari" => 5,
		"Seaweed" => 4.75,
		"Morning Glory" => 0.50,
	}

	def menu
		DISHES
	end	


	def order(placed_order)
		#raise "Something missing!" if payment != @total
		@total = placed_order.inject(0) {|argument, (dish,quantity)| 
		argument + menu[dish] * quantity } 
		
	end

	def total
		@total
	end

	def time
		@time = (Time.new + 3600).stftime "%H:%M"
	end

	# def text
	# 	@body = "Thank you! Your order was placed and will be delivered before #{@time}"
	# 	@account = @client.account
	# 	@message = @account.sms.messages.create({:from => '+447736955684', :to => '+447736955684', :body => @body })
	# 	puts @message
	# end

	def twilio_client
    account_sid = TwilioCredentials::AC9bc8da8ea5863b67f0267af867efc24e
    auth_token = TwilioCredentials::aefad98a07d327818905a6f4e934d6ba
    @twilio_client ||= Twilio::REST::Client.new account_sid, auth_token
    end

 	def send_text(message)
    twilio_client.account.sms.messages.create(
      :from => TwilioCredentials::FROM_NUMBER,
      :to => TwilioCredentials::TO_NUMBER,
      :body => message)
  end

	

	
end

