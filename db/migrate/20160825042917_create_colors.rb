class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.string :nombre
      t.string :codigo

      t.timestamps
    end
  end
end
