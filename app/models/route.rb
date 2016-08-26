class Route < ActiveRecord::Base

	belongs_to :waste_picker
	has_many :line_strings
    has_many :colors

end
