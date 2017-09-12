class CreatePets < ActiveRecord::Migration[5.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :animalType
      t.string :petSizeType
      t.string :petfinderBreedType
      t.string :petAgeType
      t.string :shelterName
      t.string :location
      t.string :petGenderType
      t.string :petStatusType
    end
  end
end
