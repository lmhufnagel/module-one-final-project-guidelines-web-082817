class Pet < ActiveRecord::Base
  has_many :selection
  has_many :users, through: :selections

  
end
