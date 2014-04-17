class ChangeLocation < ActiveRecord::Migration
  def change
    rename_column :locations, :post_id, :itinerary_id
  end
end
