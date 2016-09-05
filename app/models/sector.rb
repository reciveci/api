class Sector < ActiveRecord::Base
  belongs_to :city
  belongs_to :color
  has_many :routes
end
