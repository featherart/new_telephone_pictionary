class Storyline < ActiveRecord::Base
  attr_accessible :turn, :user_id, :active, :time_stop, :story_name
  has_many :pictures
  has_many :phrases
  accepts_nested_attributes_for :player, allow_destroy: true
end
