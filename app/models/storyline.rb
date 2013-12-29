class Storyline < ActiveRecord::Base
  attr_accessible :turn, :user_id
  has_many :pictures
  has_many :phrases

  # not sure about this foreign key validation
  # validates :phrase_id, uniqueness: true
  # validates :picture_id, uniqueness: true
end
