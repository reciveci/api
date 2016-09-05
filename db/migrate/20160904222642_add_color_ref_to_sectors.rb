class AddColorRefToSectors < ActiveRecord::Migration
  def change
    add_reference :sectors, :color, index: true
  end
end
