class RemoveColorOfRoutes < ActiveRecord::Migration
  def change
      remove_column :routes, :color
  end
end
