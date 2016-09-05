class AddSectorRefToRoutes < ActiveRecord::Migration
  def change
    add_reference :routes, :sector, index: true
  end
end
