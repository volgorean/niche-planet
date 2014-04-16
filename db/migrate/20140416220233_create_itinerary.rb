class CreateItinerary < ActiveRecord::Migration
  def change
    create_table :itineraries do |t|
      t.integer :post_id
      t.string :how_much
      t.string :what
      t.time :time
      t.date :date
    end
  end
end


