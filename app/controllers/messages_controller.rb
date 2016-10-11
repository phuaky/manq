class MessagesController < ApplicationController
  def sms
    account_sid = "AC6b5d5cde4eeaa56581da7cd359e4ce07" # Your Account SID from www.twilio.com/console
    auth_token = "d78af85228d57437e4eb632d46468d66"   # Your Auth Token from www.twilio.com/console

    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.account.messages.create({
    	:from => '+61439877373',
    	:to => '+6591777366',
    	:body => 'Your queue no is #123.',
    })

    redirect_to '/'
  end
end
