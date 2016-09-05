class CreateSectors < ActiveRecord::Migration
  def change
    create_table :sectors do |t|
      t.string :name
      t.boolean :enabled
      t.references :city, index: true

      t.timestamps
    end
  end
end
