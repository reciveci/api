class AddColorIdToRoutes < ActiveRecord::Migration
  def change
    add_reference :routes, :color, index: true
  end
end
