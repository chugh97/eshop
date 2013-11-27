class User < ActiveRecord::Base
  has_many :orders
  #attr_accessible :name,:last_name,:email

end
