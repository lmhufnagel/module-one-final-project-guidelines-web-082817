class CreatePets < ActiveRecord::Migration[5.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :animalType
      t.string :mix
      t.string :petGenderType
    end
  end
end
