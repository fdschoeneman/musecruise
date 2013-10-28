require "test_helper"

describe Amenity do

  subject { Amenity.new }

  describe "db" do 

    describe "columns and types" do
      
      it { must have_db_column(:name).of_type(:string) }
    end
  end

  describe "associations" do

    it { must have_many(:tours_amenities) }
  end
end
