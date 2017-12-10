class CreateFourteeners < ActiveRecord::Migration[5.0]
  def change
    create_table :fourteeners do |t|
      t.string :name
      t.string :surname
      t.integer :elevation_in_feet
      t.integer :rank
      t.float :location_lat
      t.float :location_long
      t.string :forest
      t.string :range
      t.decimal :classification
      t.integer :exposure
      t.integer :elevation_gain_in_feet
      t.decimal :round_trip_distance_in_miles
      t.integer :no_4wd_additional_elevation_in_feet
      t.decimal :no_4wd_additional_distance_in_miles
      t.string :route_name
      t.string :trailhead_name
      t.float :trailhead_lat
      t.float :trailhead_long
      t.decimal :four_x_four_required
      t.string :additional_info_url
      t.text :description
      t.binary :kml

      t.timestamps
    end
  end
end
