# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'json'

file_path = Rails.root.join('db', 'geospatial_data.geojson')
data = JSON.parse(File.read(file_path))

data['features'].each do |feature|
  properties = feature['properties']
  geometry = feature['geometry']

  SpatialLayer.create(
    name: properties['name'],
    latitude: geometry['coordinates'][1],
    longitude: geometry['coordinates'][0],
    value: properties['value']
  )

end
