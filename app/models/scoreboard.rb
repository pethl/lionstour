class Scoreboard < ActiveRecord::Base
  attr_accessible :comments, :fixture_id, :matchscore, :user_id
  
  validates :fixture_id, presence: true
  validates :user_id, presence: true
  
  def self.generate_full(fixture_id)
    
      @users = User.pluck(:id)
      t = 0
      @users.each do |user|
        
        m = Matchpick.where(:user_id => user, :status => "Locked")
        @playerpicks = Playerpick.where(:matchpick_id => m, :selected => true)
         
          @playerpicks.each do |playerpick|
           s = SquadPerformance.where(:squad_id => playerpick.squad_id, :fixture_id => fixture_id) 
           t += s[0].total
          end
          
          q = Scoreboard.new(:fixture_id => fixture_id, :user_id => user, :matchscore => t)
          q.save
      end
    end
    def self.generate(fixture_id)

        @users = User.pluck(:id)
        t = 0
        @users.each do |user|

            q = Scoreboard.new(:fixture_id => fixture_id, :user_id => user, :matchscore => 0)
            q.save
        end
      end
  
end
