class AddPic < ActiveRecord::Migration
  def change
    add_attachment :niches, :image
  end
end
