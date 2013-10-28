class CreateToursAmenities < ActiveRecord::Migration
  def change
    create_table :tours_amenities do |t|
      t.integer :tour_id
      t.integer :amenity_id

      t.timestamps
    end
  end
end
