require "test_helper"

feature "Users::Authentication Feature Test" do
  Given {  
    visit new_user_registration_path
    fill_in 'user_email', with: 'test@test.com'
    find_button('Sign up').click 
  }
  Then {
      page.must have_selector("#flash_notice", text: /link has been sent/) }
    And { 
      User.where(email: "test@test.com").wont_be_nil }
    And { 
      ActionMailer::Base.deliveries.first.subject.must_equal "Confirmation instructions"
    }


end
