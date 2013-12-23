class PlayersController < ApplicationController
  require 'twilio-ruby'

  def create
    puts "*"*50
    puts "in players create"
    puts "*"*50
    @player = Player.create(params[:player])
    text = "hi"
    @player.send_text(text)
    binding.pry
    #render :json => @player
    render nothing: true
  end
end