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
    # it { must have_many(:addresses_addressable) }
    # it { must have_many(:addresses).through(:addresses_addressable) }
    # it { must have_many(:certifications_holdable) }
    # it { must have_many(:certifications).through(:certifications_holdable) }
    # it { must have_many(:images) }
    # it { must have_many(:positions) }
    # it { must have_many(:showcases) }
    # it { must accept_nested_attributes_for(:images) }
  end
  
  describe "validations" do 

    # Given(:existing_user) { create(:user) }
    # Given(:hacker) {  User.new(attributes_for(:user, email: existing_user.email)) }
    
    describe "must be the only user with a given email" do

      # Then { hacker.wont_be valid }
    end
  end
end