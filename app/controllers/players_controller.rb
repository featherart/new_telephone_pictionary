class PlayersController < ApplicationController
  require 'twilio-ruby'

  def create
    puts "*"*50
    puts "in players create"
    puts "*"*50
    @player = Player.create(params[:player])
    text = "Hello #{@player.name}! #{current_user.name} has invited you to play Telephone Pictionary. Please log on to http://telephone-pictionary.herokuapp.com to participate!"
    @player.send_text(text)
    binding.pry # can I get a turn number here?
    #render :json => @player
    render nothing: true
  end
end