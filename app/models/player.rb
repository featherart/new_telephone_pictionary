class Player < ActiveRecord::Base
  attr_accessible :email, :name, :phone, :storyline_id, :turn_number
  belongs_to :storyline

  def joining
    start_time = Time.now
    self.update_attributes(accepted: true, start_time: start_time)
  end

  def send_text(text_message)
    account_sid    = ENV["TWILIO_ACCOUNT_SID"]
    auth_token     = ENV["TWILIO_AUTH_TOKEN"]
    client = Twilio::REST::Client.new account_sid, auth_token

    account = client.account
    message = account.sms.messages.create({
      :from => ENV["phone"],
      :to => self.phone,
      :body => text})
    puts message
  end

  def clean_phone_number
    number = self.phone

    if number
      unless number[0..1] == "+1"
        number.gsub!(/[^0-9]/, '')
        self.phone = "+1#{number}"
      end
    end
  end



end
