require "test_helper"

describe ToursAmenity do

  subject { ToursAmenity.new }

  describe "db" do 

    describe "columns and types" do
      
      it { must have_db_column(:tour_id).of_type(:integer) }
      it { must have_db_column(:amenity_id).of_type(:integer) }
    end
  end

  describe "associations" do

    it { must belong_to(:tour) }
    it { must belong_to(:amenity) }
  end
  
end
