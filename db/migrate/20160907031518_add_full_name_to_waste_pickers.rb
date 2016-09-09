class AddFullNameToWastePickers < ActiveRecord::Migration
  def change
      add_column :waste_pickers, :fullName, :string
  end
end
