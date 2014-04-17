class ChangeItinerary < ActiveRecord::Migration
  def change
    add_column :itineraries, :lat, :float
    add_column :itineraries, :lng, :float
    drop_table :locations
  end
end
