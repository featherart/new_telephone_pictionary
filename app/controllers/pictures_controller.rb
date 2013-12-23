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
    @picture.save()
    
    respond_to do |format|
      format.js
  	end
  end

  def show
  	@picture = Picture.find(params[:id])
  end
end
