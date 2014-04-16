class Post < ActiveRecord::Base
  validates :title, :presence => true
  validates :description, :presence => true
  belongs_to :user
  belongs_to :niche
end
