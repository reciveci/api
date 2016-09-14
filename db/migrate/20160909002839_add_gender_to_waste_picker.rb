class AddGenderToWastePicker < ActiveRecord::Migration
  def change
      add_column :waste_pickers, :gender, :string
  end
end
