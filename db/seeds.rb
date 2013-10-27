# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by(name: role)
end
puts 'DEFAULT USERS'

admin = User.find_or_create_by_email(
  email: "fred.schoeneman@gmail.com",
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  phone: Faker::PhoneNumber.phone_number,
  password: ENV['ADMIN_PASSWORD']
  )
admin.add_role :admin
admin.confirm!

