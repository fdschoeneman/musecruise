class User < ActiveRecord::Base

  devise :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tour_requests, as: :tourist, class_name: "Tour"
end
