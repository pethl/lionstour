class AddCityToFixtures < ActiveRecord::Migration
  def change
    add_column :fixtures, :city, :string
  end
end
