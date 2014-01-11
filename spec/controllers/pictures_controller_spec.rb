require 'spec_helper'

describe PicturesController do
  describe "#create" do
    num_pictures = Picture.all.length
    picture = Picture.new
    picture.image = "an insanely long string"
    picture.storyline_id = 2
    picture.save

    # picture.image.should eq("an insanely long string")
    # picture.storyline_id.should eq(2)
    # Picture.all.length.should eq(num_pictures + 1)
  end
end
