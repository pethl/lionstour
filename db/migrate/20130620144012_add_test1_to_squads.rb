class AddTest1ToSquads < ActiveRecord::Migration
  def change
     add_column :squads, :test1, :boolean
     add_column :squads, :test2, :boolean
     add_column :squads, :test3, :boolean
  end
end
