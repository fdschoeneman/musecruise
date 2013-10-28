class Tour < ActiveRecord::Base

  has_many :amenities, through: :tours_amenities
  has_many :tours_amenities
end
