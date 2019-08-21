class CreateMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :maps do |t|
      t.string :followername
      t.string :followerlocation
      t.float :latitude
      t.float :longitude
    end
  end
end
