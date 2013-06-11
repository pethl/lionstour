class Playerpick < ActiveRecord::Base
  attr_accessible :matchpick_id, :name, :selected, :squad_id
  belongs_to :matchpick
end
