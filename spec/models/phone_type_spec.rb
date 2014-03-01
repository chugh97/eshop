require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PhoneType  do
  it { should have_many :phones }
end