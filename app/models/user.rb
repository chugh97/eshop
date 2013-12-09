require 'digest/sha1'
class User < ActiveRecord::Base
  has_many :orders
  has_many :addresses
  has_many :phones

  has_secure_password :validations => false

  before_save :hash_password


  private
  def hash_password
    self.encrypted_password = Digest::SHA1.hexdigest(self.encrypted_password)
  end

end
