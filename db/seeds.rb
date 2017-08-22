require 'faker'

# Faker::Name.first_name                 #=> "Kaci"

# Faker::Name.last_name                  #=> "Ernser"

# Faker::Internet.safe_email             #=> "christell@example.org"

# Faker::Internet.safe_email('Nancy')   #=> "nancy@example.net" 

number_of_contacts_wanted = 10

new_contacts_needed = number_of_contacts_wanted - Contact.count

# 5.times do 
new_contacts_needed.times do
  person = { first_name: Faker::Name.first_name, last_name: Faker::Name.last_name }
  person[:email] = Faker::Internet.safe_email("#{person[:first_name]}.#{person[:last_name]}")

  contact = Contact.new(person)
  contact.save!
end
# Contact.all
