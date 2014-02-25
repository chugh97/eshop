require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
  it { should have_many :orders }
  it { should have_many :addresses }
  it { should have_many :phones }

=begin
decribe "callbacks" do



it "should call hash_password before a save" do
model = stub_model(User)
model.stub(:valid?).and_return(true)
model.should_receive(:hash_password)
model.save
end

# test your method works...
it "should set hash the password" do
model = stub_model(User, :encrypted_password => "donotreveal").as_new_record
Digest::SHA1.stub(:hexdigest).and_return('other')
model.send :hash_password
model.encrypted_password.should_not == "donotreveal"
end
end
end=end
