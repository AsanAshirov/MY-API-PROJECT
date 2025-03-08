class CreateEarthquakes < ActiveRecord::Migration[7.1]
  def change
    create_table :earthquakes do |t|
      t.date :date
      t.time :time
      t.float :latitude
      t.float :longitude
      t.string :location
      t.float :depth

      t.timestamps
    end
  end
end
