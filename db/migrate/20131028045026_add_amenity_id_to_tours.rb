class AddAmenityIdToTours < ActiveRecord::Migration
  def change
    add_column :tours, :amenity, :string
  end
end
