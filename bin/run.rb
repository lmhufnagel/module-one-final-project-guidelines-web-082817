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

#category = new_cli.which_category

search = new_cli.search_for_animal(animal, welcome)


# sugg = new_cli.get_suggestion_from_user(name, project)
# Suggestion.create #(username:, project:, suggestion: )
#
# new_cli.add_date_time
