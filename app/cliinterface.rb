class CommandLineInterface


  def valid_account
    puts "Please enter your name"
    name = gets.chomp
  end

  def welcome(name)
    puts "Welcome #{name} to PeTinder! Lets find your perfect partner! Let us know your zipcode and we'll get started."
    zipcode = gets.chomp.to_i
  end

  def get_animal_type(zipcode)
    puts "Thank you for input! Please enter the animal type you're interested in. (cat, dog, horse, reptile, rabbit, pig, or barnyard)"
    animalType = gets.chomp.downcase
  end

  def search_for_animal(animalType, zipcode)
    petfinder.find_pets(animalType, zipcode)
  end

  
end
