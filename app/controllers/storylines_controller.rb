class StorylinesController < ApplicationController
  def index
  	@storylines = Storyline.all
    # need a way to signal storyline is complete
    # use a timestamp and set a boolean?

    @active_or_new = Storyline.last.active 
    @active_or_new ? @storyline = Storyline.last : @storyline = Storyline.new
    @turn = Turn.last.turn_number

  	@phrase = Phrase.new
  	@picture = Picture.new
    @player = Player.new
    puts "**************"
    puts "in storyline index"
    puts params
    puts "**************"
    #binding.pry
  	respond_to do |format|
  	  format.html
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
  	#binding.pry
    render nothing: true
    # respond_to do |format|
    #   format.js
    # end
  end

  # def show
  # 	@story = Story.find(params[:id])

  # 	respond_to do |format|
  # 	  format.js
  # 	end
  # end
end
