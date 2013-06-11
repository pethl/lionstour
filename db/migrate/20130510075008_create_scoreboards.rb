class CreateScoreboards < ActiveRecord::Migration
  def change
    create_table :scoreboards do |t|
      t.integer :fixture_id
      t.integer :user_id
      t.integer :matchscore
      t.string :comments

      t.timestamps
    end
  end
end
