# lib/tasks/load_contacts.rake

require "faker"

namespace :contacts do
  desc "Load sample contacts into the database"
  task load: :environment do
    # Clear existing contacts
    Contact.destroy_all

    # Create 20 random contacts
    20.times do
      Contact.create!(
        first_name: Faker::Name.first_name,
        middle_name: Faker::Name.middle_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        phone: Faker::PhoneNumber.phone_number,
        address: Faker::Address.full_address
      )
    end

    puts "Created 20 contacts."
  end
end
