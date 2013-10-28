require 'test_helper'

 describe User do 
 
  subject { User.new }

  describe "db" do 

    describe "columns and types" do
      
      it { must have_db_column(:confirmed_at).of_type(:datetime) }
      it { must have_db_column(:confirmation_token).of_type(:string) }
      it { must have_db_column(:confirmation_sent_at).of_type(:datetime) }
      it { must have_db_column(:unconfirmed_email).of_type(:string) }
      it { must have_db_column(:created_at).of_type(:datetime) }
      it { must have_db_column(:current_sign_in_ip).of_type(:string) }
      it { must have_db_column(:current_sign_in_at).of_type(:datetime) }
      it { must have_db_column(:email).of_type(:string) }
      it { must have_db_column(:encrypted_password).of_type(:string) }
      it { must have_db_column(:first_name).of_type(:string) }
      it { must have_db_column(:ip_address).of_type(:string) }
      it { must have_db_column(:last_name).of_type(:string) }
      it { must have_db_column(:last_sign_in_at).of_type(:datetime) }
      it { must have_db_column(:last_sign_in_ip).of_type(:string) }
      it { must have_db_column(:phone).of_type(:string) }
      it { must have_db_column(:remember_created_at).of_type(:datetime) }
      it { must have_db_column(:reset_password_token).of_type(:string) }
      it { must have_db_column(:reset_password_sent_at).of_type(:datetime) }
      it { must have_db_column(:sign_in_count).of_type(:integer) }
      it { must have_db_column(:updated_at).of_type(:datetime) }
    end
    
    describe "indexes" do

      it { must have_db_index(:email) }
      it { must have_db_index(:confirmation_token) }
    end
  end

  describe "associations" do

    it { must have_many(:tour_requests) }
    it { must have_many(:users_tours) }
  end
  
  describe "validations" do 

    it { validate_presence_of(:email)}

    Given(:user) { create(:user) }

    Then { user.update_attributes(first_name: "").must_equal false }
    Then { user.update_attributes(last_name: "").must_equal false }
    Then { user.update_attributes(phone: "").must_equal false }
  end

  describe "methods" do 

    Given(:user) { create(:user, first_name: "Bill", last_name: "Travis") }

    describe "fullname" do 

      Then { user.full_name.must_equal "Bill Travis"}
    end
  end
end