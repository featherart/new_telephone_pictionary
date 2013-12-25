class PhrasesController < ApplicationController
  
  def create
    puts "**************"
    puts "in phrase create"
    puts params[:text]
    puts "**************"
    
  	@phrase = Phrase.new(params[:phrase])
  	@phrase.text = params[:text]
    @phrase.save
    @storyline = Storyline.new # only create a new storyline if one isn't already in play, but how?
    @storyline.phrase_id = @phrase.id
    @storyline.user_id = current_user.id
    @storyline.turn = current_user.turn
    @storyline.save
    @turn = @storyline.turn
 
    render nothing: true
 
  end

  def destroy
    if (params[:id]) != nil
      Storyline.destroy(params[:id])
    end
  end
end
