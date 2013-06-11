class CreateMatchpicks < ActiveRecord::Migration
  def change
    create_table :matchpicks do |t|
      t.integer :user_id
      t.string :status

      t.timestamps
    end
  end
end
