class Fixture < ActiveRecord::Base
  attr_accessible :awayteam, :hometeam, :location, :matchdate, :test, :city, :match
  validates_presence_of :awayteam, :hometeam, :location, :match
  
    default_scope order: 'fixtures.matchdate ASC'
  
  def self.import(file)
     CSV.foreach(file.path, headers: true) do |row|
        Fixture.create! row.to_hash
    end
  end
  
  def full_fixture
     "#{hometeam} vs. #{awayteam} - #{location}"
  end
end
