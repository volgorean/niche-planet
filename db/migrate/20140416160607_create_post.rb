class CreatePost < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title
      t.text :description
    end
  end
end
