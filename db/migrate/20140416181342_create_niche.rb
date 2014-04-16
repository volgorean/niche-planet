class CreateNiche < ActiveRecord::Migration
  def change
    create_table :niches do |t|
      t.string :name
    end
    add_column :posts, :niche_id, :integer
    add_column(:posts, :created_at, :datetime)
    add_column(:posts, :updated_at, :datetime)
  end
end
