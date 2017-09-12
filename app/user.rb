class User < ActiveRecord::Base
  has_many :selection
  has_many :pets, through: :selections
end
