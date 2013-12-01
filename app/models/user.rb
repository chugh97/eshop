class User < ActiveRecord::Base
  has_many :orders
  has_many :addresses
  has_many :phones

end
