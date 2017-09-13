require "pry"

class CommandLineInterface


  def valid_account
    puts "Please enter your name:"
    name = gets.chomp
  end

  def welcome(name)
    puts "Welcome to PeTinder, #{name}! Lets find your perfect partner! \nPlease enter your zipcode and we'll get started."
    zipcode = gets.chomp
  end

  def create_user(name, zipcode)
      User.find_or_create_by(userName: name, userZipCode: zipcode)
  end

  def get_animal_type(zipcode)
    puts "Thank you for input! Please enter the animal type you're interested in. \n(cat, dog, horse, reptile, rabbit, pig, or barnyard)"
    animal_type = gets.chomp.downcase
    # if animalType != "cat" || "dog" || "horse" || "reptile" || "rabbit" || "pig" || "barnyard"
    #   puts "please enter a valid animal type"
    #   retry
    # end
  end

  def get_sex
    puts "What gender of animal would you prefer? Write 'M' for male or 'F' for female."
    animal_gender = gets.chomp.upcase
  end

  def get_size
    puts "What size animal are you interested in? Options are: 'S', 'M', 'L', or 'XL'."
    animal_size = gets.chomp.upcase
  end

  def search_for_animal(animal_type, zipcode, animal_gender, animal_size)
    availability_messages = ["Waiting for you...", "All yours, baby.", "Will dance for food!", "Take me home!!!!", "Will not show up drunk to your house at 3AM crying, asking for you to let me in. Will probably show up crying asking for you to let me in.", "I'm a fun-loving animal with absolutely no interest in murder.", "If you can't offer me something, GTFO.", "This is snek.", "Free the nipple."]
    petfinder = Petfinder::Client.new('acc62e2c10e9df251207a7e3a13cd91f', '693cc2fba0334d6949234494055b09f1')

    puts "Our experts have found the perfect pet for you! Its information is below!"
    # binding.pry
    options = {animal: animal_type, location: zipcode, sex: animal_gender, size: animal_size}
    new_pet = petfinder.random_pet(options)
    searched_shelter = petfinder.shelter(new_pet.shelter_id)
    # binding.pry
    puts "Name: #{new_pet.name}"
    puts "Breed: #{new_pet.breeds.first}"
    puts "Size: #{new_pet.size}"
    puts "Sex: #{new_pet.sex}"
    puts "Shelter: #{searched_shelter.name}"
    puts "Availability: #{availability_messages.sample}"
    puts "Would you like to add this pet to your matches? 'Y' or 'N'"
    # user_match_input = gets.chomp.upcase
    # if user_match_input == 'Y'
    #   Pet.create(animalName: new_pet.name, animalType: animal_type, animalBreed: new_pet.breeds.first, animalGender: animal_gender, shelterName: searched_shelter.name)
    # end
  end

  # def get_selections_from_user(name, animal)
  #   Selection.find_or_create_by(petId: animal.id, userId: name.id)
  # end

end
