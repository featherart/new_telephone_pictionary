require 'spec_helper'

describe StorylinesController do

  it "should redirect user to login if they are not logged in" do
    # when a user isn't logged in they should get logged in
  end

  describe "#create" do

    it "should create a new storyline" do
      # a new storyline gets created
      # it should have a name, a start time and an end time
      storyline = Storyline.new
      storyline.story_name = "test"
      storyline.save
      storyline.story_name == "test"
      #it should redirect_to index
    end

  end

  describe "#show" do
    # it should list all of the pictures and phrases 
    # associated with a storyline
    # it redirects to the show_story partial
  end

  describe "#index" do
    # it lists all the storylines
    # it redirects to the root path
    # it should redirect_to index
  end
end
