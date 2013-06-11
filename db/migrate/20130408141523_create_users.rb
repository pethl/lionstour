class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.boolean :admin
      t.string :password_digest
      t.string :remember_token
      t.string :email

      t.timestamps
    end
  end
end
