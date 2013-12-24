class PhrasesController < ApplicationController
  
  def create
    puts "**************"
    puts "in phrase controller"
    puts "**************"
    #@phrase = Storyline.find(params[:phrase_id]).phrases.create(text: params[:text])
  	@phrase = Phrase.create(params[:phrase])
  	#@phrase.save
    Storyline.where(phrase_id: @phrase.id).length == 0 ? @storyline = Storyline.create(phrase_id: @phrase.id, turn: 2) : @storyline = Storyline.where(phrase_id: @phrase.id)

    #@storyline = Storyline.new
    # @storyline.phrase_id = @phrase.id
    # @storyline.turn = 2
    # @storyline.save
    #@turn = 2
    #binding.pry
    #render layout: false
    #render nothing: true
  	respond_to do |format|
  	  format.js
  	end
  end

  def destroy
    if (params[:id]) != nil
      Storyline.destroy(params[:id])
    end
  end
end
