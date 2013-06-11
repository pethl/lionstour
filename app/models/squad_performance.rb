class SquadPerformance < ActiveRecord::Base
  attr_accessible :dropgoals, :fixture_id, :play, :squad_id, :total, :tries

  validates :fixture_id, presence: true
  validates :squad_id, presence: true
  
  def self.generate(fixture_id)
    
      @squadids = Squad.pluck(:id)

      i = 0
        x = Squad.count

        while i < x do
            s = SquadPerformance.new(:fixture_id => fixture_id, :squad_id => @squadids[i], :play => false, :tries => 0, :dropgoals => 0, :total => 0)
            s.save
            i = i += 1
        end
    end
    

end
