class Route < ActiveRecord::Base

	belongs_to :waste_picker
	has_many :line_strings
  belongs_to :color
  belongs_to :sector

end
