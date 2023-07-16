class CreateSpatialLayers < ActiveRecord::Migration[7.0]
  def change
    create_table :spatial_layers do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.string :value

      t.timestamps
    end
  end
end
