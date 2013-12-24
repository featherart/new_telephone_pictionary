class User < ActiveRecord::Base
  attr_accessible :name, :oauth_expires_at, :oauth_token, :provider, :uid 
  #has_one :turn_number

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end



  # def send_text(text)
  #   account_sid    = ENV["TWILIO_ACCOUNT_SID"]
  #   auth_token     = ENV["TWILIO_AUTH_TOKEN"]
  #   client = Twilio::REST::Client.new account_sid, auth_token

  #   account = client.account
  #   message = account.sms.messages.create({
  #     :from => ENV["PHONE"],
  #     :to => self.phone,
  #     :body => text})
  #   puts message
  # end


end
