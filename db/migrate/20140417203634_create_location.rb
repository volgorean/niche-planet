class CreateLocation < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :post_id
      t.float :lat
      t.float :lng
      t.integer :order
    end
  end
end
