class Fourteener < ApplicationRecord
	#example: validates :surname, presence: true, uniqueness: true, length: { maximum: 100 }
	
	validates :surname, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
	validates :elevation_in_feet, presence: true, numericality: { :greater_than_or_equal_to: 14000 , message: "14er must be taller than 14,000'"}
	validates :rank, presence: true, format: { with: /\[0-1][?]\z/, message: "only allows #s and ?s" }
	validates :location_lat, presence: true, numericality: { only_integer: true , message: "only allows integers"}
	validates :location_long , presence: true, numericality: { only_integer: true , message: "only allows integers"}
	validates :forest, presence: true, format: { with: /\A[a-zA-Z ]+\z/, message: "only allows letters and spaces" }
	validates :range, presence: true, format: { with: /\A[a-zA-Z ]+\z/, message: "only allows letters and spaces" }
	validates :classification, presence: true, format: { with: /\[1-3].[1,3,6]\z/, message: "only allows 1.1,1.3,1.6,2.1,2.3,2.6,3.1,3.3,3.6" }
	validates :exposure, presence: true, format: { with: /\[1-5]\z/, message: "only allows 1-5" }
	validates :elevation_gain_in_feet, presence: true, numericality: { :greater_than_or_equal_to: 0 , message: "elevation gain must be greater >= 0"}
	validates :round_trip_distance_in_miles, presence: true, numericality: { :greater_than_or_equal_to: 0 , message: "round trip distance must be >= 0"}
	validates :no_4wd_additional_elevation_in_feet, presence: true, numericality: { :greater_than_or_equal_to: 0 , message: "no 4x4 additionl elevation in ft must be >= 0"}
	validates :no_4wd_additional_distance_in_miles, presence: true, numericality: { :greater_than_or_equal_to: 0 , message: "no 4x4 additionl elevation in miles must be >= 0"}
	validates :route_name, presence: true, format: { with: /\A[a-zA-Z ]+\z/, message: "only allows letters and spaces" }
	validates :trailhead_name, presence: true, format: { with: /\A[a-zA-Z ]+\z/, message: "only allows letters and spaces" }
	validates :trailhead_lat, presence: true, numericality: { only_integer: true , message: "only allows integers"}
	validates :trailhead_long, presence: numericality: { only_integer: true , message: "only allows integers"}
	validates :four_x_four_required, presence: true, numericality: { only_integer: true , message: "only allows integers"}
	validates :additional_info_url, presence: true
	validates :description, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
end
