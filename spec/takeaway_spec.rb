require 'takeaway'
# require 'mocha/setup'


describe Takeaway do 

let(:takeaway) { Takeaway.new}


it 'The menu should contain a dish' do 
	expect(takeaway.menu.include?("Fried Rice")).to be_true
end 


it 'A dish in the menu should have a price' do 
	expect(takeaway.menu["Fried Rice"]).to eq(3.5)
end 

it 'Should be able to place an order and have a total payment amount calculated' do 
	o = { "Aromatic Duck" => 2, "Thai Calamari" => 1}
	expect(takeaway.order(o)).to eq(29)
end

xit 'Should have a delivery time' do
 	expect(takeaway.time).to equal()

 end 

 context 'should be able to send texts' do
    let(:twilio_client) { double :TwilioRESTClient }

    it 'using a new Twilio API client' do
      expect(Twilio::REST::Client).to receive(:new).and_return twilio_client
      expect(takeaway.twilio_client).to be twilio_client
    end

    it 'using the current Twilio API client' do
      expect(Twilio::REST::Client).to receive(:new).and_return twilio_client
      takeaway.twilio_client
      expect(takeaway.twilio_client). to be twilio_client
    end

    it 'with a message' do
      message = "Thank you!"
      account = double :account
      sms = double :sms
      messages  = double :messages
      expect(takeaway).to receive(:twilio_client).and_return twilio_client
      expect(twilio_client).to receive(:account).and_return account
      expect(account).to receive(:sms).and_return sms
      expect(sms).to receive(:messages).and_return messages
      expect(messages).to receive(:create) do |message_hash|
        expect(message_hash[:body]).to eq message
      end
      takeaway.send_text(message)
    end
  end




end 