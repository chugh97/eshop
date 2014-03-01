require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AddressType do
  it { should have_many :addresses }
end