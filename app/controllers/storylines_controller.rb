class StorylinesController < ApplicationController
  def index
  	@storylines = Storyline.all
  	@storyline = Storyline.new
    @turn = @storyline.turn
  	@phrase = Phrase.new
  	@picture = Picture.new
    @player = Player.new

  	respond_to do |format|
  	  format.html
  	end
  end

  def create  	
  	# need to add all the pictures & phrases before 
  	# creating and saving the storyline
    puts "**************"
    puts "in storyline controller"
    puts "**************"
  	#@storyline = Storyline.new(params[:storyline])
    @storyline = Storyline.includes(phrases: :phrase_id).first
    
    #@project = Project.includes(tasks: :logs).first

    # @picture = Picture.new(params[:picture])
    # @phrase = Phrase.new(params[:phrase])
    # @storyline.picture_id = @picture.id
    # @storyline.phrase_id = @phrase.id
    @turn = Turn.last.turn_number
    @storyline.turn = @turn
  	@storyline.save()
  	binding.pry #this never executes - why?
  	render layout: false

  	# respond_to do |format|
  	#   format.json
  	# end
  	#redirect_to @story
  end

  # def show
  # 	@story = Story.find(params[:id])

  # 	respond_to do |format|
  # 	  format.js
  # 	end
  # end
end
