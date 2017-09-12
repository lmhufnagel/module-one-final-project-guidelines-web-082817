class CommandLineInterface


  def valid_account
    puts "Please enter your name"
    name = gets.chomp
  end

  def welcome(name)

    puts "Welcome to PeTinder, #{name}! Lets find your perfect partner! Let us know your zipcode and we'll get started."
    zipcode = gets.delete("\n")
    # binding.pry
    # # zipcode = zipcode - "\n"
    # if zipcode.length != 5
    #   puts "Please enter a valid zipcode."
    #   welcome(name)
    # end
  end

  def get_animal_type(zipcode)
    puts "Thank you for input! Please enter the animal type you're interested in. (cat, dog, horse, reptile, rabbit, pig, or barnyard)"
    animalType = gets.chomp.downcase
    # if animalType != "cat" || "dog" || "horse" || "reptile" || "rabbit" || "pig" || "barnyard"
    #   puts "please enter a valid animal type"
    #   retry
    # end
  end


  def search_for_animal(animalType, zipcode)
    availability_messages = ["Waiting for you...", "All yours, baby.", "Will dance for food!", "Take me home!!!!"]

    begin
    petfinder = Petfinder::Client.new('acc62e2c10e9df251207a7e3a13cd91f', '693cc2fba0334d6949234494055b09f1')

    searched_pet = petfinder.find_pets(animalType, zipcode)

  rescue
    puts "Your input did not register, please try again!"
    valid_account
  end
    puts "Our experts have found the perfect pet for you! Its information is below!"
    new_pet = searched_pet.sample
    puts "Name: #{new_pet.name}"
    puts "Breed: #{new_pet.breeds}"
    puts "Size: #{new_pet.size}"
    puts "Sex: #{new_pet.sex}"
    puts "Availability: #{availability_messages.sample}"

  end

end
