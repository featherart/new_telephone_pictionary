class StorylinesController < ApplicationController
  #before_filter :require_login
 
  def index
  	@storylines = Storyline.all
    # need a way to signal storyline is complete
    # use a timestamp and set a boolean?
    # turn this on later for now, too annoying to reset each time
    #@active_or_new = Storyline.last.active 
    #@active_or_new ? @storyline = Storyline.last : @storyline = Storyline.new
    @active_or_new = false
    @storyline = Storyline.last
    @turn = Turn.last.turn_number
    #@player = Player.new

  	@phrase = Phrase.new
  	@picture = Picture.new
  
  	respond_to do |format|
  	  format.html
      format.json {@storyline}
  	end
  end

  def create     
    puts "**************"
    puts "in storyline create"
    puts "**************" 	
  	@storyline = Storyline.create(params[:storyline])
    @storyline.time_stop = @storyline.created_at + 5.minutes
    @storyline.active = true
  	@storyline.save!
    @turn = Turn.create(turn_number: 1, user_id: current_user.id)

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end
  
  # will need this if we are displaying stories!
  # do an ajax call then render the partial that displays a story
  def show 
  	@storyline = Storyline.find(params[:id])

    render partial: 'show_storyline'

  	# respond_to do |format|
  	#   format.js
  	# end
  end

end
