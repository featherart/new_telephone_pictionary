class PicturesController < ApplicationController
  def index
  	@pictures = Picture.all
  	@picture = Picture.new
    puts "**************"
    puts "in pictures index"
    puts "**************"
  	respond_to do |format|
  	  format.html
  	end
  end

  def new
  	@picture = Picture.new
    puts "**************"
    puts "in pictures new"
    puts "**************"
  	respond_to do |format|
  	  format.js
  	end
  end

  def create
    puts "**************"
    puts "in pictures create"
    puts "**************"
    @picture = Picture.new(params[:picture])
    @picture.image = params[:image]
    @picture.storyline_id = params[:storyline_id]
    binding.pry
    @picture.save!

    # this needs to happen here for now but there might be a better place
    #Turn.where(turn_number: @storyline.turn).first ? @turn = Turn.where(turn_number: @storyline.turn).first). : @turn.create = 1
    @turn = Turn.last
    @turn.turn_number += 1
    @turn.save!
    @turn_number = @turn.turn_number    
    render nothing: true
  end

  def show
  	@picture = Picture.find(params[:id])
  end
end
