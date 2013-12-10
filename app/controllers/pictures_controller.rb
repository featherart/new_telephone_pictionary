class PicturesController < ApplicationController
  def index
  	@pictures = Picture.all
  	@picture = Picture.new

  	respond_to do |format|
  	  format.html
  	end
  end

  def new
  	@picture = Picture.new

  	respond_to do |format|
  	  format.js
  	end
  end

  def create
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
