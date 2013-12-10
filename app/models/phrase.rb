class Phrase < ActiveRecord::Base
  attr_accessible :text
  belongs_to :storyline
end
