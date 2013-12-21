class PlayersController < ApplicationController
  require 'twilio-ruby'

  def create
    @player = Player.create(params[:player])
    text = "Hi #{@player.name}. #{current_user.name} has invited you to play Telephone Pictionary. Please reply with 'ok' to accept."
    @player.send_text(text)
    render :json => @player
  end
end