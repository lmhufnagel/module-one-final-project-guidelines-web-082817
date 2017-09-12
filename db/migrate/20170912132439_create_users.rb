class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :age
      t.string :location
      t.string :gender
      t.string :availability
    end
  end
end
