class CreatePredicts < ActiveRecord::Migration
  def change
    create_table :predicts do |t|
      t.integer :fixture_id
      t.integer :user_id
      t.integer :homescore
      t.integer :awayscore
      t.integer :matchpick_id

      t.timestamps
    end
  end
end
