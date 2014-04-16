class Itinerary < ActiveRecord::Base
  belongs_to :post
  validates :what, :presence => true
end
