class Amenity < ActiveRecord::Base

  has_many :tours_amenities
end
