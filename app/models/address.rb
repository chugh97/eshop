class Address < ActiveRecord::Base
  belongs_to :user
  belongs_to :address_type

end
