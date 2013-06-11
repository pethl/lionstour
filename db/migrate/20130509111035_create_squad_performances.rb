class CreateSquadPerformances < ActiveRecord::Migration
  def change
    create_table :squad_performances do |t|
      t.integer :fixture_id
      t.integer :squad_id
      t.boolean :play
      t.integer :tries
      t.integer :dropgoals
      t.integer :total

      t.timestamps
    end
  end
end
