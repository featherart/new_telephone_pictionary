class StorylinesController < ApplicationController
  def index
  	@storylines = Storyline.all
  	@storyline = Storyline.new

  	@phrase = Phrase.new
    @phrase_id = @phrase.id
    @storyline.phrase_id = @phrase_id
    # @phrase.save
    puts "************* @phrase"
    #puts @phrase
    puts "************* @phrase"

  	@picture = Picture.new
   #  @picture_id = @picture.id
   #  @picture.save
    
    @turn = Turn.last.turn_number
    @storyline.turn = @turn
    #binding.pry
    #@turn = @storyline.turn #this will currently be nil
                            # it needs to get set somehow

  	respond_to do |format|
  	  format.html
  	end
  end

  def create  	
  	# need to add all the pictures & phrases before 
  	# creating and saving the storyline
  	@picture = Picture.new(params[:picture])
  	@phrase = Phrase.new(params[:phrase])
  	@storyline = Storyline.new(params[:storyline])
    @storyline.picture_id = @picture.id
    @storyline.phrase_id = @phrase.id
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
