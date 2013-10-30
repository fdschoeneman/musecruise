require "test_helper"

describe Tour do

  subject { Tour.new }

  describe "db" do 

    describe "columns and types" do

      it { must have_db_column(:amenity).of_type(:string) }
      it { must have_db_column(:end_date).of_type(:date) }
      it { must have_db_column(:questions).of_type(:string) }
      it { must have_db_column(:start_date).of_type(:date) }
      it { must have_db_column(:tourist_id).of_type(:integer) }
    end
  end

  describe "associations" do 

    it { must belong_to(:tourist) } 
    it { must have_many(:amenities) } 

  end

  describe "methods" do 

    it "must respond to tourist" do

      subject.must_respond_to :tourist
    end 
  end
end
