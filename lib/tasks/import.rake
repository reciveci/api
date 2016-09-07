#lib/tasks/import.rake
require 'csv'
desc "Imports a CSV file into an ActiveRecord table"
task :import, [:filename] => :environment do
    # Cities
    CSV.foreach('db/data/cities.csv', :headers => true) do |row|
      City.create!(row.to_hash)
    end
    # Sectors
    CSV.foreach('db/data/sectors.csv', :headers => true) do |row|
      Sector.create!(row.to_hash)
    end
    # Affiliations
    CSV.foreach('db/data/affiliations.csv', :headers => true) do |row|
      Affiliation.create!(row.to_hash)
    end
    # Waste Pickers
    CSV.foreach('db/data/waste_pickers.csv', :headers => true) do |row|
      WastePicker.create!(row.to_hash)
    end
    # Routes
    CSV.foreach('db/data/routes.csv', :headers => true) do |row|
      Route.create!(row.to_hash)
    end
    # Routes Line Strings
    CSV.foreach('db/data/line_strings.csv', :headers => true) do |row|
      LineString.create!(row.to_hash)
    end
    # Colors
    CSV.foreach('db/data/colors.csv', :headers => true) do |row|
      Color.create!(row.to_hash)
    end
end
