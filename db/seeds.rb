# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Create admin user
User.create(login: "admin", email: "admin@ireminder.com", password: "admin123", password_confirmation: "admin123", role: "admin", register_number: 1, mobile_number: 9123456789)
puts "Admin user created. Login: admin, Password: admin123"