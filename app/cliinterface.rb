class CommandLineInterface


  def valid_account
    puts "Please enter your name"
    name = gets.chomp
  end

  def welcome(name)
    puts "Welcome to PeTinder, #{name}! Lets find your perfect partner! Let us know your zipcode and we'll get started."
    zipcode = gets.chomp.to_i
  end

  def get_animal_type(zipcode)
    puts "Thank you for input! Please enter the animal type you're interested in. (cat, dog, horse, reptile, rabbit, pig, or barnyard)"
    animalType = gets.chomp.downcase
  end

  def search_for_animal(zipcode, animalType)
    petfinder = Petfinder::Client.new('acc62e2c10e9df251207a7e3a13cd91f', '693cc2fba0334d6949234494055b09f1')

    searched_pet = petfinder.find_pets(zipcode, animalType, count: 25)
    puts "Our experts have found the perfect pet for you! Its name is below!"
    puts searched_pet.sample.name
  end

end
