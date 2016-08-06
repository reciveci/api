#lib/tasks/import.rake
require 'csv'
desc "Imports a CSV file into an ActiveRecord table"
task :import, [:filename] => :environment do
    CSV.foreach('db/data/routes.csv', :headers => true) do |row|
      Route.create!(row.to_hash)
    end
    CSV.foreach('db/data/line_strings.csv', :headers => true) do |row|
      LineString.create!(row.to_hash)
    end
end
