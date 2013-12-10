class PhrasesController < ApplicationController
  def index
  	@phrases = Phrase.all
  	@phrase = Phrase.new
    
  	respond_to do |format|
  	  format.html
  	end
  end

  def create
  	@phrase = Phrase.new(params[:phrase])
  	@phrase.save
    @storyline = Storyline.new
    @storyline.phrase_id = @phrase.id
    @storyline.turn = 2
    @storyline.save
    
    render layout: false
  	respond_to do |format|
  	  format.js
  	end
  end
end
