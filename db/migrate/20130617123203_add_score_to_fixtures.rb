class AddScoreToFixtures < ActiveRecord::Migration
  def change
     add_column :fixtures, :score, :string
  end
end
