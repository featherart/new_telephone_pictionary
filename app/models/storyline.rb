class Storyline < ActiveRecord::Base
  attr_accessible :turn, :user_id, :active, :time_stop
  has_many :pictures
  has_many :phrases
  has_many :players

end
