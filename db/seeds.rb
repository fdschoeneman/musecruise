puts 'creating roles'

YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by(name: role)
end

puts 'creating default user'

admin = User.find_or_create_by_email(
  email: ENV['ADMIN_EMAIL'].dup,
  first_name: ENV['ADMIN_FIRST_NAME'].dup,
  last_name: ENV['ADMIN_LAST_NAME'].dup,
  phone: Faker::PhoneNumber.phone_number,
  password: ENV['ADMIN_PASSWORD']
)
admin.add_role :admin
admin.confirm!

puts 'creating list of amenities'

["pool", "rec room", "movie theater", "on site doctor", "time machine"
].each do |amenity_name|
  Amenity.find_or_create_by_name(name: amenity_name)
end
