require_relative '../config/environment'
require_relative "../app/pet.rb"
# require_relative "../app/selections.rb"
# require_relative "../app/user.rb"
require_relative '../app/cliinterface'
# require_relative '../app/models/dataimporter'

new_cli = CommandLineInterface.new
#new_cli.run

name = new_cli.valid_account

welcome = new_cli.welcome(name)

create_user = new_cli.create_user(name, welcome)

match_response = "More"

while match_response == "More"

  animal = new_cli.get_animal_type(welcome)

  sex = new_cli.get_sex

  size = new_cli.get_size

  availability = new_cli.availability_message_holder

  response = "N"

  while response == "N"

    found_pet = new_cli.find_random_pet(animal, welcome, sex, size)

    found_shelter = new_cli.find_shelter_for_pet(found_pet)

    new_cli.print_animal_info(found_pet, found_shelter, availability)

    response = gets.chomp.upcase
  end

  create_pet = new_cli.create_pet(found_pet, animal, sex, found_shelter)

  add_selections = new_cli.get_selections_from_user(create_pet, create_user)

  new_cli.get_match_response

  match_response = gets.chomp.capitalize

end

new_cli.view_matches(create_user)
# 1 get user info and store it in variables
# 2 get user animal preference and store in variable
# 3 structure and send query to api
# 4 present response and gather user input (YN)
# 5 if N, go to 3, if Y continue execution
# 6 etc..
