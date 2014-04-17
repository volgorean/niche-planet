class Location < ActiveRecord::Base
  belongs_to :post
  validates :lat, :presence => true
  validates :lng, :presence => true
  validates :post_id, :presence => true
end
