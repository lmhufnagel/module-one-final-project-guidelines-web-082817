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

animal = new_cli.get_animal_type(welcome)

create_user = new_cli.create_user(name, welcome)

sex = new_cli.get_sex

size = new_cli.get_size

availability = new_cli.availability_message_holder

find_random_pet = new_cli.find_random_pet(animal, welcome, sex, size)

find_shelter = new_cli.find_shelter_for_pet(find_random_pet)

search = new_cli.search_for_animal(find_random_pet, find_shelter, availability)

create_pet = new_cli.create_pet(find_random_pet, animal, sex, find_shelter)

selections = new_cli.get_selections_from_user(create_pet, create_user)
