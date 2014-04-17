class Post < ActiveRecord::Base
  validates :title, :presence => true
  validates :description, :presence => true
  belongs_to :user
  belongs_to :niche
  has_many :itineraries
  has_many :locations
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
