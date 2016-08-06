class AddCityRefToAffiliations < ActiveRecord::Migration
  def change
    add_reference :affiliations, :city, index: true
  end
end
