class AddMatchToFixtures < ActiveRecord::Migration
  def change
     add_column :fixtures, :match, :date
  end
end
