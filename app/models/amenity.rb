class Amenity < ActiveRecord::Base

  has_many :tours_amenities
  has_many :tours, through: :tours_amenities
end
