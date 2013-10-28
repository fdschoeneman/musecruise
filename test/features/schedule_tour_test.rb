require "test_helper"

feature "Request a tour Feature Test" do
  
  Given {  
    clear_emails
    visit new_user_registration_path
    fill_in 'user_email', with: 'test@test.com'
    find_button('Sign up').click }


  Then {
    page.must have_selector("#flash_notice", text: /Check your email/) }
  And { 
    User.where(email: "test@test.com").wont_be_nil }
  And { 
    ActionMailer::Base.deliveries.first.subject.must_equal "Confirmation instructions"  }

  context "confirm must" do 

    When(:confirm) { 
      open_email('test@test.com')
      current_email.click_link('Confirm my account')

      fill_in 'user_first_name', with: 'Arnold'
      fill_in 'user_last_name', with: 'Schwarzenegger'
      fill_in 'user_password', with: 'stonecrop'
      fill_in 'user_password_confirmation', with: 'stonecrop'
      fill_in 'user_phone', with: '555-555-5555'
      click_button 'Confirm that you are a player'
    }
    
    Then { confirm
      fill_in 'tour_start_date', with: '2014/01/01'
      fill_in 'tour_start_date', with: '2014/02/03'
      fill_in 'tour_questions', with: Faker::Bloocher.review
      save_and_open_page
    }

  end

  # context "" do 
  # end


end
