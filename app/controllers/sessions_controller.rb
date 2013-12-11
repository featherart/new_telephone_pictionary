class SessionsController < ApplicationController
  def create
  	user = User.from_omniauth(env["omniauth.auth"])
  	session[:user_id] = user.id
  	redirect_to root_url

  	# add the turn here once Facebook auth working
  	@turn = Turn.create(turn_number: 1, user_id: user.id)
  	#binding.pry
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_url
  end
end
