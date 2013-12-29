class StorylinesController < ApplicationController
  def index
  	@storylines = Storyline.all
  	@storyline = Storyline.last # need a way to signal storyline is complete
    #@turn = current_user.turn_number if current_user 
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
  	# need to add all the pictures & phrases before 
  	# creating and saving the storyline
    puts "**************"
    puts "in storyline create"
    puts "**************"
  	@storyline = Storyline.new(params[:storyline])
    @storyline.turn = params[:turn_number]  
  	@storyline.save()
  	
    respond_to do |format|
      format.js
    end
  end

  # def show
  # 	@story = Story.find(params[:id])

  # 	respond_to do |format|
  # 	  format.js
  # 	end
  # end
end
