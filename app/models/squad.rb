class Squad < ActiveRecord::Base
  attr_accessible :age, :country, :group, :height, :name, :position, :position_strg, :weight, :test1, :test2, :test3
  
   validates_presence_of :name
   validates :group, presence: true
   validates :position, presence: true
  

     default_scope order: 'squads.position ASC'

     def self.import(file)
       CSV.foreach(file.path, headers: true) do |row|
        Squad.create! row.to_hash
    end
  end
end

