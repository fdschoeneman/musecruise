namespace 'db:development:create' do 

  task users: :environment do

    small_notice("generic users")
    @users.to_i.times do |n|
      first_name = Faker::Name.first_name 
      last_name = Faker::Name.last_name 
      email = Faker::Internet.email
      password  = "password"
      user = User.new(first_name: first_name,
        last_name: last_name, email: email, password: password,
        phone: Faker::PhoneNumber.phone_number
      )  
      user.skip_confirmation!
      user.save!
      user.confirm!
    end
    
    testers = [
      ["fred.schoeneman+agent@gmail.com", "agent"], 
      ["fred.schoeneman+admin@gmail.com", "admin"]
    ]
    
    testers.each do |email, role|
      small_notice("user: #{role} account for #{email}")
    
      user = User.new(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name, 
        email: email, 
        password: "password",
        password_confirmation: "password"
      )
      user.save
      user.confirm!
      user.add_role role
    end
  end
end


def make_admin_user

  user = User.new(
    name: "Fred Schoeneman", 
    email: "fred.schoeneman@gmail.com", 
    password: "password",
    password_confirmation: "password", 
    bio: hipster_bios.first)

  user.save!
  user.confirm!
  user.add_role :admin
end
