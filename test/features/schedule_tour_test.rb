require "test_helper"

feature "Request a tour Feature Test" do
  
  before do
    # set up amenities 
    ["pool", "rec room", "movie theater", "on site doctor", "time machine"].each do |amenity_name|
      Amenity.find_or_create_by(name: amenity_name)
    end
  end

  scenario "tourist requests an account" do
    clear_emails
    visit root_path
    fill_in 'user_email', with: 'test@test.com'
    find_button('Sign up').click
    page.must have_selector("#flash_notice", text: /Check your email/)
    User.where(email: "test@test.com").wont_be_nil
    ActionMailer::Base.deliveries.first.subject.must_equal "Confirmation instructions"  
  end

  scenario "Tourist confirms email address and requests a tour" do 
    tourist = User.find_or_create_by(email: "email@example.com") 
    open_email(tourist.email)
    current_email.click_link('Confirm my account')
    clear_emails
    fill_in 'user_first_name', with: 'Arnold'
    fill_in 'user_last_name', with: 'Schwarzenegger'
    fill_in 'user_password', with: 'stonecrop'
    fill_in 'user_password_confirmation', with: 'stonecrop'
    fill_in 'user_phone', with: '555-555-5555'
    click_button 'Confirm that you are a player'
    page.must have_selector("#flash_notice", text: /successfully confirmed/)
    fill_in 'tour_start_date', with: '2014/01/01'
    fill_in 'tour_end_date', with: '2014/02/03'
    fill_in 'tour_questions', with: Faker::Bloocher.review
    select('pool', from: 'tour_amenities')
    click_button 'Create Tour'
    page.must have_selector("#flash_notice", text: /successfully created/)
    ActionMailer::Base.deliveries.find(subject: "Arnold Schwarzenegger requested a tour").wont_be_nil  
    ActionMailer::Base.deliveries.find(subject: "Glad to have you aboard").wont_be_nil
    open_email(tourist.email)
    current_email.click_link('rating')
    page.must have_selector('h2', text: /rate your tour/)
    select('1', from: 'tour_rating')
    click_button 'rate this tour'
    page.must have_selector("#flash_notice", text: /thanks for the feedback/)
  end
end
