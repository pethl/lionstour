class CreateFixtures < ActiveRecord::Migration
  def change
    create_table :fixtures do |t|
      t.string :location
      t.string :hometeam
      t.string :awayteam
      t.datetime :matchdate
      t.boolean :test

      t.timestamps
    end
  end
end
