class Tour < ActiveRecord::Base

  belongs_to :tourist, class_name: "User", foreign_key: :tourist_id
  has_many :tours_amenities
  has_many :amenities, through: :tours_amenities

  validates :start_date, :end_date, :questions, presence: true
end
